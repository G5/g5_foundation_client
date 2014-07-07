# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'g5_foundation_client/version'

Gem::Specification.new do |spec|
  spec.name          = "g5_foundation_client"
  spec.version       = G5FoundationClient::VERSION
  spec.authors       = ["Don Petersen"]
  spec.email         = ["don@donpetersen.net"]
  spec.summary       = %q{Client gem to interact with G5 services.}
  spec.description   = %q{Client gem to interact with G5 services.}
  spec.homepage      = "https://github.com/g5/g5_foundation_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "virtus"
  spec.add_dependency "httparty"
  spec.add_dependency "microformats2"
  spec.add_dependency "g5_authentication_client", ">= 0.2"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  # 2.99+ is a release to help with upgrading, which... thanks, but not now.
  spec.add_development_dependency "rspec", "< 2.99"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
end
