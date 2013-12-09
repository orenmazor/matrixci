require './lib/adapters/adapter'

module MatrixCi
  class Project
    def self.all
      conf = YAML.load(File.open(File.dirname(__FILE__) + "/../conf/config.yml").read)

      conf.keys.map {|key| Project.new(key, conf[key]["adapter"], conf[key]["token"])}
    end

    def initialize(name, adapter, token)
      @name = name
      @adapter = MatrixCi::Adapter[adapter].new(token)
      @token = token
    end

    def all_recent_builds
      projects = @adapter.all_recent_builds 
    end
  end
end
