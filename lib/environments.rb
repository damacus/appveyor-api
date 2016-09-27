# frozen_string_literal: true
require 'faraday'
require 'json'

# Wrapper around the Environment object
# Used for searching for environments
#
# == Parameters:
# name
#   A String containing the environment you are looking for
#
# == Returns:
# An environment
#
class Environments
  def find_by_name(_name)
    conn = Faraday.new(url: 'https://ci.appveyor.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    # GET environment by name
    # env_resp =
    conn.get do |r|
      r.url '/api/environments'
      r.headers['Content-Type'] = 'application/json'
      r.headers['Authorization'] = 'Bearer gt4hl5w028pdwujykubb'
    end

    # env_list = JSON.parse(env_resp.body)

    # GET environment settings (i.e. the actual environment object)
    Environment.new
  end
end

# The environment object as per the AppVeyor API documentation
# https://www.appveyor.com/docs/api/environments-deployments/
# CRUD actions for an environment
#
# == Parameters:
# deployment_environment_id:
# projects_mode:
# account_id
# name:
# settings
# => provider_settings: array of settings
#    [{"name"=>"test_setting",
#      "value"=>{"isEncrypted"=>false,
#      "value"=>"myaccount"}}]

# == Returns:
# An environment object
#
class Environment
  def initialize(options = {})
    options.each { |k, v| public_send("#{k}=", v) } if options
  end

  def id
    @deploymentEnvironmentId
  end

  def deployment_environment_id
    @deploymentEnvironmentId
  end

  def account_id
    @accountId
  end

  def projects_mode
    @projectsMode
  end

  attr_accessor :deploymentEnvironmentId
  attr_accessor :accountId
  attr_accessor :name
  attr_accessor :provider
  attr_accessor :projectsMode
  attr_accessor :created
  attr_accessor :updated
  attr_accessor :settings
  attr_accessor :provider_settings
end
