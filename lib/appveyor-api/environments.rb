# frozen_string_literal: true

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
    def environment_list
      envs_list = send_get('/api/environments').body
      envs_hash = {}
      (0..envs_list.length - 1).each do |e|
        envs_hash.store(envs_list[e]['deploymentEnvironmentId'], envs_list[e]['name'])
      end
      envs_hash
    end

    def find_by_name(name)
      found_environment = {}
      found_environment = environment_list.select { |_key, val| val == name }
      raise 'Multiple Environments found during search' if found_environment.length > 1

      environment = send_get("/api/environments/#{found_environment.keys.first}/settings")
      AppVeyor::Environment.new(environment.body['environment'])
    end

    def find_by_id(id)
      environment = send_get("/api/environments/#{id}/settings")
      AppVeyor::Environment.new(environment.body['environment'])
    end

    def create_environment(environment)
      env = send_post('/api/environments', environment)
      AppVeyor::Environment.new(env.body['environment'])
    end

    def update_environment(environment)
      env = send_put('/api/environments', environment)
      AppVeyor::Environment.new(env.body)
    end

    def delete_environment(environment_id)
      send_delete("/api/environments/#{environment_id}")
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
    attr_accessor :message
    attr_accessor :tags
  end
end
