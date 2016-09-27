
# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'benzinator/version'

Gem::Specification.new do |spec|
  spec.name          = 'appveyor-api'
  spec.version       = AppVeyor::VERSION
  spec.authors       = ['Dan Webb']
  spec.email         = ['dan.webb@damacus.io']
  spec.summary       = 'Gem to wrap AppVeyor API'
  spec.description   = 'Gem to wrap AppVeyor API'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'faraday'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'faraday'
  spec.add_dependency 'json'
end
