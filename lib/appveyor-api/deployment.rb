# frozen_string_literal: true

# Deployment
def get_deployment(_config, _deployment_id); end

def start_deployment(config)
  # body = {
  #   environmentName: 'psm-archive-production',
  #   accountName: 'js-devops',
  #   projectSlug: 'psm-archive',
  #   buildVersion: '1.0.269'
  # }
  # response = HTTParty.post('https://ci.appveyor.com/api/deployments',
  #                          body: body.to_json,
  #                          headers: { 'Authorization' => "Bearer #{config.api_token}",
  #                                     'Content-Type' => 'application/json',
  #                                     'Accept' => 'application/json' })
  #
  # puts response.code
end

def start_deployment(config)
#   conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
#     faraday.request  :url_encoded             # form-encode POST params
#     faraday.response :logger                  # log requests to STDOUT
#     faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
#   end
end

def start_deploy(api_token)
  # body = {
  #   environmentName: environment_name,
  #   accountName: account_name,
  #   projectSlug: project_slug,
  #   buildVersion: build_version
  # }
  # response = HTTParty.post('https://ci.appveyor.com/api/deployments',
  #                          body: body.to_json,
  #                          headers: { 'Authorization' => "Bearer #{api_token}",
  #                                     'Content-Type' => 'application/json',
  #                                     'Accept' => 'application/json'
  #                                     })
end

def cancel_deployment(_config, _deployment_id)
  # /api/deployments/stop
end
