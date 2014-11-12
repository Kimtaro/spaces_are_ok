# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spaces_are_ok/version'

Gem::Specification.new do |spec|
  spec.name          = "spaces_are_ok"
  spec.version       = SpacesAreOk::VERSION
  spec.authors       = ["Kim Ahlström"]
  spec.email         = ["kim.ahlstrom@gmail.com"]
  spec.description   = %q{Allows the use of strings as class names, module names and method names}
  spec.summary       = %q{Use strings as class, module and method names}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_dependency "rubyfish", "~> 0.0.6"
end
