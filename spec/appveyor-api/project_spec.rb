# frozen_string_literal: true

RSpec.context AppVeyor::Project do
  describe 'Projects Object', :project do
    before :each do
      @project = AppVeyor::Project.new(
"projectId"=>253781,
"accountId"=>33256,
"accountName"=>"damacus",
"builds"=>[{"buildId"=>5827807,
            "jobs"=>[],
            "buildNumber"=>17,
            "version"=>"1.0.17",
            "message"=>"Rubocopping",
            "branch"=>"custom_resource",
            "isTag"=>false,
            "commitId"=>"1a5dcedd40582a4ae9e1d39017c0d4ea80e4212d",
            "authorName"=>"Dan Webb",
            "authorUsername"=>"damacus",
            "committerName"=>"Dan Webb",
            "committerUsername"=>"damacus",
            "committed"=>"2016-11-23T23:13:26+00:00",
            "messages"=>[],
            "status"=>"success",
            "started"=>"2016-11-23T23:14:00.0819882+00:00",
            "finished"=>"2016-11-23T23:16:09.0466691+00:00",
            "created"=>"2016-11-23T23:13:53.5210388+00:00",
            "updated"=>"2016-11-23T23:16:09.0466691+00:00"}],
  "name"=>"chef-opsview-client",
  "slug"=>"chef-opsview-client",
  "repositoryType"=>"gitHub",
  "repositoryScm"=>"git",
  "repositoryName"=>"damacus/chef-opsview-client",
  "repositoryBranch"=>"custom_resource",
  "isPrivate"=>false,
  "skipBranchesWithoutAppveyorYml"=>false,
  "enableSecureVariablesInPullRequests"=>false,
  "enableSecureVariablesInPullRequestsFromSameRepo"=>false,
  "enableDeploymentInPullRequests"=>false,
  "rollingBuilds"=>false,
  "alwaysBuildClosedPullRequests"=>false,
  "tags"=>"",
  "nuGetFeed"=>{"id"=>"chef-opsview-client-h4ujwyhcqlss",
                "name"=>"Project chef-opsview-client",
                "publishingEnabled"=>false,
                "created"=>"2016-11-13T14:31:03.3641232+00:00"},
  "securityDescriptor"=>{
    "accessRightDefinitions"=>[
      {"name"=>"View","description"=>"View"},
      {"name"=>"RunBuild","description"=>"Run build"},
      {"name"=>"Update","description"=>"Update settings"},
      {"name"=>"Delete", "description"=>"Delete project"}],
      "roleAces"=>[
        {"roleId"=>53960,
          "name"=>"Administrator",
          "isAdmin"=>true,
          "accessRights"=>[
            {"name"=>"View", "allowed"=>true},
            {"name"=>"RunBuild", "allowed"=>true},
            {"name"=>"Update", "allowed"=>true},
            {"name"=>"Delete", "allowed"=>true}
          ]},
        {"roleId"=>53961,
          "name"=>"User",
          "isAdmin"=>false,
          "accessRights"=>[
            {"name"=>"View"},
            {"name"=>"RunBuild"},
            {"name"=>"Update"},
            {"name"=>"Delete"}
            ]}
            ]},
            "created"=>"2016-11-13T14:31:01.25483+00:00",
            "updated"=>"2016-11-13T14:31:39.8699239+00:00"
      )
    end

    it 'should return a project' do
      expect(@project).to be_an_instance_of(AppVeyor::Project)
    end

    it 'should have a project and account Id' do
      expect(@project).to respond_to(:project_name)
      expect(@project).to respond_to(:account_id)
    end

    it 'should return an array of builds' do
      expect(@project.builds).to be_kind_of(Array)
      expect(@project.builds).to_not be_kind_of(String)
    end
  end

  describe 'Project', :project do
    before :each do
      @project = AppVeyor::Client.new
    end

    it 'should return a Project List' do
      VCR.use_cassette('projects list') do
        expect(@project).to respond_to(:list_projects)
        expect(@project.list_projects).to be_kind_of(Hash)
        expect(@project.list_projects[223829]).to include('chef-appveyor-ci')
        expect(@project.list_projects[223829]).to_not include('chef-opsview-client')
        expect(@project.list_projects).to include(223829 => 'chef-appveyor-ci')
        expect(@project.list_projects).to_not include(223829 => 'otherstuff')
      end
    end
  end
end
