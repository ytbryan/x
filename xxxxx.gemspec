# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xxxxx/version'

Gem::Specification.new do |spec|
  spec.name          = "xxxxx"
  spec.version       = Xxxxx::VERSION
  spec.authors       = ["Bryan Lim"]
  spec.email         = ["ytbryan@gmail.com"]

  spec.summary       = %q{Cross allows you to cross post to twitter and facebook from command line.}
  spec.description   = %q{Cross allows you to cross post to twitter and facebook from command line.}
  spec.homepage      = "http://github.com/ytbryan/xxxxx"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["x"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor' , '~> 0.19.1'
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
