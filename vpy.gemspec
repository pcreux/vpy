# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'versapay/version'

Gem::Specification.new do |spec|
  spec.name          = "vpy"
  spec.version       = Versapay::VERSION
  spec.authors       = ["Philippe Creux"]
  spec.email         = ["pcreux@gmail.com"]
  spec.description   = %q{Versapay command line tool}
  spec.summary       = %q{Send and request money via Versapay from the command line}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
