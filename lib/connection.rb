
# frozen_string_literal: true
class Connection
  def initialize(token)
    @token = token
  end

  attr_reader :token
end
