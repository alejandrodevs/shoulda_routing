# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shoulda_routing/version'

Gem::Specification.new do |spec|
  spec.name          = 'shoulda_routing'
  spec.version       = ShouldaRouting::VERSION
  spec.authors       = ['Alejandro Gutiérrez']
  spec.email         = ['alejandrodevs@gmail.com']
  spec.description   = 'A simple and easy DSL to test rails routes.'
  spec.summary       = 'A simple DSL to test rails routes.'
  spec.homepage      = 'https://github.com/alejandrodevs/shoulda_routing'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'rails', '>= 4.0'

  spec.add_development_dependency 'rspec-rails', '~> 3.4'
  spec.add_development_dependency 'cucumber', '~> 2.3'
  spec.add_development_dependency 'aruba', '~> 0.14'
  spec.add_development_dependency 'rake', '~> 11.1'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
