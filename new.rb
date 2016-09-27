# frozen_string_literal: true
require 'faraday'

conn = Faraday.new(url: 'https://ci.appveyor.com') do |faraday|
  faraday.request  :url_encoded
  faraday.adapter  Faraday.default_adapter
end

response = conn.get do |r|
  r.url '/api/environments'
  r.headers['Content-Type'] = 'application/json'
  r.headers['Authorization'] = 'Bearer na7tmwbhaat014trjs3j'
end

puts response.body
