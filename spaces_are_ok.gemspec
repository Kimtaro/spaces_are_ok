# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spaces_are_ok/version'

Gem::Specification.new do |spec|
  spec.name          = "spaces_are_ok"
  spec.version       = SpacesAreOk::VERSION
  spec.authors       = ["Kim Ahlström"]
  spec.email         = ["kim.ahlstrom@gmail.com"]
  spec.description   = %q{Allows the use of natural language as class names, module names and method names}
  spec.summary       = %q{Use natural language as class, module and method names}
  spec.homepage      = "https://github.com/Kimtaro/spaces_are_ok"
  spec.license       = "MIT"
  spec.required_ruby_version = '~> 2.1'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "maxitest", "~> 1.0.3"
  spec.add_dependency "rubyfish", "~> 0.0.6"
end
