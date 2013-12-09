require "matrixci/version"
require 'yaml'
Dir[File.dirname(__FILE__) + "/adapters/*.rb"].each {|f| require f}
require "project"

module MatrixCi
end
