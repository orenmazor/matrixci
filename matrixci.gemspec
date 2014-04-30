# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrixci/version'

Gem::Specification.new do |spec|
  spec.name          = "matrixci"
  spec.version       = Matrixci::VERSION
  spec.authors       = ["Oren Mazor"]
  spec.email         = ["oren.mazor@gmail.com"]
  spec.description   = %q{A bashful tool to monitor CI}
  spec.summary       = %q{A bashful tool to monitor CI}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rainbow"
  spec.add_dependency "rbcurse-core"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "mocha"
end
