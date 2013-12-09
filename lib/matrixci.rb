require "matrixci/version"
require 'yaml'
Dir["./adapters"].each {|f| require f}
require "project"

module MatrixCi
end
