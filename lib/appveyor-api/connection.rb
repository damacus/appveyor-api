
# frozen_string_literal: true

module AppVeyorApi
  module Connection
    def initialize(token)
      @token = token

      Faraday.new(url: 'https://ci.appveyor.com') do |faraday|
        faraday.request  :url_encoded
        faraday.adapter  Faraday.default_adapter
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['Authorization'] = "Bearer #{@token}"
      end
    end

    attr_reader :token
  end
end
