require 'faraday'
require 'json'

class Environments
  def find_by_name(name)
    conn = Faraday.new(url: 'https://ci.appveyor.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    # GET environment by name
    env_resp = conn.get do |r|
      r.url '/api/environments'
      r.headers['Content-Type'] = 'application/json'
      r.headers['Authorization'] = "Bearer na7tmwbhaat014trjs3j"
    end

    env_list = JSON.parse(env_resp.body)

    # GET environment settings (i.e. the actual environment object)


    Environment.new()
  end
end

class Environment
  def initialize(options = {})
    if options
      options.each { |k,v| public_send("#{k}=",v)}
    end
  end
  def id
    @deploymentEnvironmentId
  end
  def settings
    @settings
  end
  attr_accessor :deploymentEnvironmentId
  attr_accessor :accountId
  attr_accessor :name
  attr_accessor :provider
  attr_accessor :projectsMode
  attr_accessor :created
  attr_accessor :updated
end
