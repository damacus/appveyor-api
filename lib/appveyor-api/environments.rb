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
module AppVeyor
  module Environments
    # returns Environments hash
    def environment_list
      envs_list = send_get('/api/environments').body
      envs_hash = {}
      (0..envs_list.length - 1).each do |e|
         envs_hash.store(envs_list[e]['name'], envs_list[e]['deploymentEnvironmentId'])
      end
      return envs_hash
    end

    def find_by_name(name)
      e = environment_list
      env = send_get("/api/environments/#{e[name]}/settings")
      AppVeyor::Environment.new(env['environment'])
    end
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

module AppVeyor
  # == Returns:
  # An environment object
  #4
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
end