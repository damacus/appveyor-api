require 'Faraday'

# Setup config object
class AppveyorConfig
  include Faraday
  # base_uri 'https://ci.appveyor.com/api'

  # def initialize(account, project, api_token)
  #   @account = account
  #   @project = project
  #   @api_token = api_token
  # end
  #
  # attr_reader :account
  # attr_reader :project
  # attr_reader :api_token
end

# require_relative 'environments'
# require_relative 'deployment'
# require_relative 'build'
# require_relative 'projects'

# def get_project_last_build_tests_count(config)
#   response = HTTParty.get("https://ci.appveyor.com/api/projects/#{config.account}/#{config.project}",
#                           headers: { 'Authorization' => "Bearer #{config.api_token}" })
#   response['build']['jobs'].each do |x|
#     puts x['testsCount']
#   end
# end
