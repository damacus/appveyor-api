# frozen_string_literal: true

module AppVeyor
  module Projects
    def get_project_last_build(config)
      # response = HTTParty.get("https://ci.appveyor.com/api/projects/#{config.account}/#{config.project}",
      #                         headers: { 'Authorization' => "Bearer #{config.api_token}" })
      # response['build']['message']
    end

    def list_projects()
      projects_list = send_get('/api/projects').body
      projects_hash = {}
      (0..projects_list.length - 1).each do |x|
        projects_hash.store(projects_list[x]['projectId'], projects_list[x]['name'])
      end
      projects_hash
    end
  end

  class Project
    def initialize(options = {})
      options.each { |k, v| public_send("#{k}=", v) } if options
    end
    attr_accessor :projectId
    attr_accessor :accountId
    attr_accessor :accountName
    attr_accessor :builds
    attr_accessor :name
    attr_accessor :slug
    attr_accessor :repositoryType
    attr_accessor :repositoryScm
    attr_accessor :repositoryName
    attr_accessor :repositoryBranch
    attr_accessor :isPrivate
    attr_accessor :skipBranchesWithoutAppveyorYml
    attr_accessor :enableSecureVariablesInPullRequests
    attr_accessor :enableSecureVariablesInPullRequestsFromSameRepo
    attr_accessor :enableDeploymentInPullRequests
    attr_accessor :rollingBuilds
    attr_accessor :alwaysBuildClosedPullRequests
    attr_accessor :tags
    attr_accessor :nuGetFeed
    attr_accessor :securityDescriptor
    attr_accessor :created
    attr_accessor :updated

    def project_id
      @projectId
    end

    def account_id
      @accountId
    end

    def project_name
      @name
    end

    def account_name
      @accountName
    end

    def repository_type
      @repositoryType
    end

    def repository_scm
      @repositoryScm
    end

    def repository_name
      @repositoryName
    end

    def repository_branch
      @repositoryBranch
    end

    def isPrivate
      @isPrivate
    end

    def skip_branches_without_appveyor_yml
      @skipBranchesWithoutAppveyorYml
    end

    def enable_secure_variables_in_pull_requests
      @enableSecureVariablesInPullRequests
    end

    def enable_secure_variables_in_pull_requests_from_same_repo
      @enableSecureVariablesInPullRequestsFromSameRepo
    end

    def enbale_deployment_in_pull_requests
      @enableDeploymentInPullRequests
    end

    def rolling_builds
      @rollingBuilds
    end

    def always_build_closed_pull_requests
      @alwaysBuildClosedPullRequests
    end

    def nuget_feed
      @nuGetFeed
    end

    def security_descriptor
      @securityDescriptor
    end
  end
end
