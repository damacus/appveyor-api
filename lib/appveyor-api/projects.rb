# frozen_string_literal: true
# Project
def get_project_last_build(config)
  # response = HTTParty.get("https://ci.appveyor.com/api/projects/#{config.account}/#{config.project}",
  #                         headers: { 'Authorization' => "Bearer #{config.api_token}" })
  # response['build']['message']
end

def get_projects(config)
  # response = Faraday.get do |req|
  #   req.url "https://ci.appveyor.com/api/projects/#{config.account}/#{config.project}"
  #   req.headers['Authorization'] = "Bearer #{config.api_token}"
  # end
end
