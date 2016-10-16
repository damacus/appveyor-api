# frozen_string_literal: true

context AppVeyor::Client do
  describe 'Environments' do
    before(:each) do
      @client = AppVeyor::Client.new
    end

    it 'should return an environment' do
      VCR.use_cassette('environment cassette') do
        expect(@client.find_by_name('dev')).to be_an_instance_of(AppVeyor::Environment)
      end
    end
    it 'should return an environment list' do
      expect(@client).to respond_to(:environment_list)

      VCR.use_cassette('environment_list cassette') do
        expect(@client.environment_list).to be_a(Hash)
      end
    end
  end
end

context AppVeyor::Environment do
  describe 'Dev Environment (hits API)' do
    describe 'dev' do
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
end
