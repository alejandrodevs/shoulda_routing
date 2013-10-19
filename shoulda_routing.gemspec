# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shoulda_routing/version'

Gem::Specification.new do |spec|
  spec.name          = "shoulda_routing"
  spec.version       = ShouldaRouting::VERSION
  spec.authors       = ["Alejandro Gutiérrez"]
  spec.email         = ["alejandrodevs@gmail.com"]
  spec.description   = "A simple and easy DSL to test rails routes."
  spec.summary       = "A simple DSL to test rails routes."
  spec.homepage      = "https://github.com/alejandrogutierrez/shoulda_routing"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rails', '~> 4.0.0'
  spec.add_development_dependency 'aruba', '~> 0.5.3'
  spec.add_development_dependency 'rspec-rails', '~> 2.14.0'
  spec.add_development_dependency 'cucumber', '~> 1.3.8'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
