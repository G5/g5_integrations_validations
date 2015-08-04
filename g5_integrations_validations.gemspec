# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'g5_integrations_validations/version'

Gem::Specification.new do |spec|
  spec.name          = "g5_integrations_validations"
  spec.version       = G5IntegrationsValidations::VERSION
  spec.authors       = ["Ramon Tayag"]
  spec.email         = ["ramon.tayag@gmail.com"]
  spec.summary       = %q{Common validations for G5 Integrations}
  spec.description   = %q{Common validations for G5 Integrations}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "virtus"
  spec.add_development_dependency "shoulda-matchers", "~> 2.7"
  spec.add_development_dependency "gemfury_helpers"
end
