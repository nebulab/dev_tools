# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dev_tools/version'

Gem::Specification.new do |spec|
  spec.name          = "dev_tools"
  spec.version       = DevTools::VERSION
  spec.authors       = ["Nebulab"]
  spec.email         = ["alessiorocco@nebulab.it"]
  spec.summary       = %q{Developer tools used in nebulab}
  spec.description   = %q{Developer tools used in nebulab}
  spec.homepage      = "https://github.com/nebulab/dev_tools"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.7"
  spec.add_development_dependency "rake", ">= 10.0"

  spec.add_runtime_dependency 'pry-rails'
  spec.add_runtime_dependency 'pry-byebug'
  spec.add_runtime_dependency 'pry-doc'
  spec.add_runtime_dependency 'awesome_print'
  spec.add_runtime_dependency 'letter_opener'
  spec.add_runtime_dependency 'dotenv-rails'
  spec.add_runtime_dependency 'rubocop'
  spec.add_runtime_dependency 'invoker'
end
