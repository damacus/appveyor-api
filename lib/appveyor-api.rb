# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'

# require 'appveyor-api/client'

requires = %w[
  build
  client
  collaborators
  deployment
  environments
  projects
  response
  roles
  users
]
# environment

requires.each { |path| require_relative "./appveyor-api/#{path}" }
