# frozen_string_literal: true
# Collaborators

def get_collaborators(config)
  # HTTParty.get('https://ci.appveyor.com/api/collaborators',
  #              headers: { 'Authorization' => "Bearer  #{config.api_token}" })
end

def get_collaborator(config, _user_id)
  # HTTParty.get("https://ci.appveyor.com/api/collaborator/#{userId}",
  #              headers: { 'Authorization' => "Bearer  #{config.api_token}" })
end

def add_collaborator
end

def update_collaborator
end

def delete_collaborator
end
