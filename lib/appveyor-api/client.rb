
# frozen_string_literal: true

require 'appveyor-api/environments'
require 'appveyor-api/projects'
# require 'appveyor-api/response'

module AppVeyor
  # Main client object that you interactive with AppVeyor via
  #
  # == Parameters:
  #
  # == Use:
  # @client = AppVeyor::Client.new
  # @client.find_by_name('dev')
  #
  class Client
    include Environments
    include Projects

    def initialize(access_token: nil)
      @access_token = access_token
    end

    def send_get(path, params = nil, headers = nil)
      send_request(:get, path, params, headers)
    end

    def send_post(path, params = nil, headers = nil)
      send_request(:post, path, params, headers)
    end

    def send_put(path, params = nil, headers = nil)
      send_request(:put, path, params, headers)
    end

    def send_delete(path, params = nil, headers = nil)
      send_request(:delete, path, params, headers)
    end

    def send_request(method, path, params = nil, headers = nil)
      AppVeyor::Response.new(appveyor_connection.send(method, path, params, headers))
    end

    def appveyor_connection
      @appveyor_connection ||= Faraday.new(faraday_options) do |c|
        c.request :json
        c.response :json
        c.adapter Faraday.default_adapter
        # c.response :logger, ::Logger.new(STDOUT)
      end
    end

    def faraday_options
      {
        url:     faraday_url,
        headers: faraday_headers
      }
    end

    def default_headers
      {
        'Accept'        => 'application/json',
        'Authorization' => "Bearer #{access_token}"
      }
    end

    def faraday_headers
      default_headers
    end

    def access_token
      @access_token || ENV['APPVEYOR_API_KEY']
    end

    def faraday_url
      @api_endpoint ||= 'https://ci.appveyor.com'
    end
  end
end
