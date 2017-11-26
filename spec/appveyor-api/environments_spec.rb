# frozen_string_literal: true
require 'spec_helper'

RSpec.describe 'Environments', :environment do
  before(:each) do
    @client = AppVeyor::Client.new(access_token: ENV['APPVEYOR_API_KEY'])
  end

  it 'should return an environment' do
    VCR.use_cassette('environment cassette') do
      expect(@client.find_by_name('dev')).to be_an_instance_of(AppVeyor::Environment)
    end
  end

  it 'should return environment 32724 (aka production)' do
    VCR.use_cassette('environment 32724') do
      expect(@client.find_by_id('32724')).to be_an_instance_of(AppVeyor::Environment)
    end
  end

  it 'should return an environment list', :environment_list do
    expect(@client).to respond_to(:environment_list)

    VCR.use_cassette('environment_list cassette') do
      expect(@client.environment_list).to be_a(Hash)
    end
  end

  context 'dev Environment' do
    it 'should have an environment variable' do
      VCR.use_cassette('dev environment cassette') do
        @environment = AppVeyor::Client.new
        @dev_environment = @environment.find_by_name('dev')

        expect(@dev_environment.settings['environmentVariables'][0]['name'])
          .to match('environment-variable-1')

        expect(@dev_environment.settings['environmentVariables'][0]['value']['value'])
          .to match('environment-variable')
      end
    end
  end
end
