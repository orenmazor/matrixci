require 'open-uri'
require 'json'
require 'build'

module MatrixCi
  class CircleCi
    def user_info
    end

    def recent_build_for(project_name, username)
      result = open("https://circleci.com/api/v1/project/#{username}/#{project_name}?circle-token=#{@token}").read
    end

    def all_recent_builds
      result = open("https://circleci.com/api/v1/recent-builds?circle-token=#{@token}").read
      builds = JSON.parse(result)
      builds.map do |build|
        Build.new(id: build["build_num"], branch: build["branch"], committer: build["committer_name"],started: build["start_time"],ended: build["stop_time"], outcome: build["outcome"], ref: build["vcs_revision"], subject: build["subject"], projectname: build["vcs_url"].split("/").last)
      end
    end

    def initialize(token)
      @token = token
    end
  end
end
