require 'open-uri'
require 'json'
require 'build'

module MatrixCi
  class CircleCi
    def user_login
      @userlogin ||= begin
                       result = open("https://circleci.com/api/v1/me?circle-token=#{@token}").read

                       JSON.parse(result)["login"]
                     end
    end

    def recent_build_for(project_name, username)
      result = open("https://circleci.com/api/v1/project/#{username}/#{project_name}?circle-token=#{@token}").read
    end

    def all_recent_builds
      result = nil
      
      while !result
        begin
          result = open("https://circleci.com/api/v1/recent-builds?circle-token=#{@token}").read
        rescue OpenURI::HTTPError => e
        end
      end
      builds = JSON.parse(result)
      builds.map do |build|
        b = Build.new(id: build["build_num"], branch: build["branch"], committer: build["committer_name"],started: build["start_time"],ended: build["stop_time"], outcome: build["outcome"], ref: build["vcs_revision"], subject: build["subject"], projectname: build["vcs_url"].split("/").last)

        b.mine if user_login == build["user"]["login"]
        b
      end
    end

    def initialize(token)
      @token = token
    end
  end
end
