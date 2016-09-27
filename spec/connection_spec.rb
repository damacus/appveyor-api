# frozen_string_literal: true
require 'connection'

describe 'AppVeyor connection' do
  before(:each) do
    @connection = Connection.new('test_token')
  end

  it 'should exist' do
    expect(@connection).to be_an_instance_of(Connection)
  end

  it 'should return a token' do
    expect(@connection.token).to match('test_token')
  end
end
