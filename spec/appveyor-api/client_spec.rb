# frozen_string_literal: true
require 'spec_helper'

describe AppVeyor::Client do
  before(:each) do
    @client = AppVeyor::Client.new(access_token: 'test_token')
  end

  it 'should exist' do
    expect(@client).to be_an_instance_of(AppVeyor::Client)
  end

  it 'should return an access_token' do
    expect(@client.access_token).to match('test_token')
  end
end
