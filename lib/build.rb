require './lib/adapters/adapter'
require 'rainbow'

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
    end

    def to_s
      str = "#{@id}\t#{@branch}\t#{@committer}\t#{@ref}\t#{@subject}"

      color = :white
      if running?
        color = :yellow
      else
        color = :green if successful?
        color = :red unless successful?
      end

      str.foreground(color)
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
  end
end
