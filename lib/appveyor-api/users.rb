# Users
def get_users(config)
  # HTTParty.get('https://ci.appveyor.com/api/users',
  #              headers: { 'Authorization' => "Bearer  #{config.api_token}" })
end

def get_user(config, userId)
  # HTTParty.get("https://ci.appveyor.com/api/user/#{userId}",
  #              headers: { 'Authorization' => "Bearer  #{config.api_token}" })
end

def add_user(config, user[])
  # HTTParty.get("https://ci.appveyor.com/api/user/#{userId}",
  #              headers: { 'Authorization' => "Bearer  #{config.api_token}" })
end

def update_user(config user[])
  # PUT /api/users
end

def delete_user(config, userId)
  # DELETE /api/users/{userId}
end
