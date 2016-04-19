# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alchemy/site_bootstrapping/version'

Gem::Specification.new do |spec|
  spec.name          = "alchemy-site_bootstrapping"
  spec.version       = Alchemy::SiteBootstrapping::VERSION
  spec.authors       = ["Robin Böning"]
  spec.email         = ["robin.boening@bitspire.de"]
  spec.description   = %q{Bootstrap your Alchemy sites}
  spec.summary       = %q{Bootstrap your Alchemy sites}
  spec.homepage      = "https://bitspire.de"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
end
