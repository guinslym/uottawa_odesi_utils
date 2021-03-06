# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uottawa_odesi_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "uottawa_odesi_utils"
  spec.version       = UottawaOdesiUtils::VERSION
  spec.authors       = ["Guinsly Mondesir"]
  spec.email         = ["guinslym@gmail.com"]
  spec.summary       = %q{A library to work with uottawa ddi xml file }
  spec.description   = %q{Utils library for DDI file}
  spec.homepage      = "https://github.com/guinslym/uottawa_odesi_utils"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  spec.add_development_dependency 'nokogiri', '~> 1.6', '>= 1.6.6.2'
  spec.add_development_dependency 'rspec-nc', '~> 0.2', '>= 0.2.0'
  spec.add_development_dependency 'guard', '~> 2.12', '>= 2.12.4'
  spec.add_development_dependency 'guard-rspec', '~> 4.5', '>= 4.5.0'
end
