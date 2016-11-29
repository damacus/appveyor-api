
# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'appveyor-api'
  spec.version       = '0.0.1'
  spec.authors       = ['Dan Webb']
  spec.email         = ['dan.webb@damacus.io']
  spec.summary       = 'Gem to wrap AppVeyor API'
  spec.description   = 'Gem to wrap AppVeyor API for simpler interactions with the AppVeyor Api'
  spec.homepage      = 'https://github.com/damacus/appveyor-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~>1.12'
  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'rb-readline', '~> 0.5'
  spec.add_development_dependency 'growl', '~> 1.0'
  spec.add_development_dependency 'guard', '~> 2.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'simplecov', '~> 0.12'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.2'

  spec.add_dependency 'faraday', '~> 0.9.2'
  spec.add_dependency 'faraday_middleware', '~> 0.10.0'
  spec.add_dependency 'json', '~> 2.0'
end
