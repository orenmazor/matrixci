require File.dirname(__FILE__)+'/adapters/adapter'
require 'rainbow'
require 'json'

module MatrixCi
  class Build
    def initialize(options)
      @id = options[:id]
      @branch = options[:branch]
      @committer = options[:committer]
      @started = options[:started]
      @ended = options[:ended]
      @outcome = options[:outcome]
      @subject = options[:subject]
      @ref = options[:ref]
      @projectname = options[:projectname]
    end

    def to_json
      str = "%s %10s %10s %40s %25s %15s %s" % [@id, @started.nil? ? "?" : @started[11,8], @projectname, @branch, @committer, @ref, @subject]

      {:str => str, :highlight => @highlight, :color => running? ? :yellow : successful? ? :green : :red }.to_json
    end

    def to_s
      str = "%s %10s %10s %40s %25s %15s %s" % [@id, @started.nil? ? "?" : @started[11,8], @projectname, @branch, @committer, @ref, @subject]

      color = :white
      if running?
        color = :yellow
      else
        color = :green if successful?
        color = :red unless successful?
      end

      str = str.bright if @highlight
      str.foreground(color)
    end

    def mine
      @highlight = true
    end

    def successful?
      @outcome != "failed"
    end

    def running?
      @ended.nil?
    end

    def runtime
      (DateTime.parse(@ended) - DateTime.parse(@started)).to_i/60
    end

    def cancel
    end

    def retry
    end

    def show
    end
  end
end
