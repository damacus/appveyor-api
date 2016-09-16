require 'faraday'

conn = Faraday.new(:url => 'https://ci.appveyor.com') do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  # faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

response = conn.get do |r|
  r.url '/api/environments'
  r.headers['Content-Type'] = 'application/json'
  r.headers['Authorization'] = "Bearer na7tmwbhaat014trjs3j"
end

puts response.body
