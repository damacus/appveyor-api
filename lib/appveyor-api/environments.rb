# frozen_string_literal: true
require 'faraday'
require 'json'
require 'appveyor-api/connection'

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

  conn = AppVeyorApi::Connection.new('gt4hl5w028pdwujykubb')

  def environment_list
    envs_resp = conn.get do |r|
      r.url '/api/environments'
    end

    envs_list = JSON.parse(envs_resp.body)
    envs_hash = {}
    (0..envs_list.length - 1).each do |e|
       envs_hash.store(envs_list[e]['name'], envs_list[e]['deploymentEnvironmentId'])
    end
    return envs_hash
  end
  # returns Environments hash
  def find_by_name(name)
    e = environment_list

    env_resp = conn.get do |r|
      r.url "/api/environments/#{e[name]}/settings"
    end

    env = JSON.parse(env_resp.body)

    Environment.new(env['environment'])
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

  def selected_projects
    @selectedProjects
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
  attr_accessor :environmentAccessKey
  attr_accessor :selectedProjects
  attr_accessor :projects
  attr_accessor :securityDescriptor
end
