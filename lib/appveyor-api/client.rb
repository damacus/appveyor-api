
# frozen_string_literal: true
require 'appveyor-api/environments'
require 'appveyor-api/response'

module AppVeyor
  class Client
    include Environments

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
        'Authorization' => "Bearer #{access_token}",
      }
    end

    def faraday_headers
      return default_headers
    end

    def access_token
      @access_token || ENV['APPVEYOR_API_KEY']
    end

    def faraday_url
      @api_endpoint || 'https://ci.appveyor.com'
    end
  end
end
