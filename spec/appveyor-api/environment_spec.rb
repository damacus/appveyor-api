# frozen_string_literal: true

context AppVeyor::Environment do
  describe 'Stubbed environment' do
    describe 'test' do
      before :each do
        @environment = AppVeyor::Environment.new('deploymentEnvironmentId' => 10_989,
                                                 'accountId' => 56_787,
                                                 'provider' => 'Agent',
                                                 'name' => 'test',
                                                 'settings' =>
                                        { 'providerSettings' =>
                                          [{
                                            'name' => 'test_setting',
                                            'value' => {
                                              'isEncrypted' => false,
                                              'value' => 'myaccount'
                                            }
                                          },
                                           {
                                             'name' => 'test_setting_2',
                                             'value' => {
                                               'isEncrypted' => true,
                                               'value' => '1234567890'
                                             }
                                           }]
                                        })
      end
      it 'should have a name' do
        expect(@environment).to respond_to(:name)
        expect(@environment.name).to match('test')
      end

      it 'should have an id' do
        expect(@environment.id).to match(10_989)
      end

      it 'should have an account id' do
        expect(@environment.account_id).to match(56_787)
      end

      it 'should have an Agent provider' do
        expect(@environment.provider).to match('Agent')
      end

      it 'should have an unencrypted Test Setting' do
        expect(@environment.settings['providerSettings'][0]['name']).to match('test_setting')
        expect(@environment.settings['providerSettings'][0]['value']['value']).to match('myaccount')
        expect(@environment.settings['providerSettings'][0]['value']['isEncrypted']).to be(false)
      end

      it 'should have an encrypted Setting' do
        expect(@environment.settings['providerSettings'][1]['name']).to match('test_setting_2')
        expect(@environment.settings['providerSettings'][1]['value']['value']).to match('1234567890')
        expect(@environment.settings['providerSettings'][1]['value']['isEncrypted']).to be(true)
      end
    end
  end
end

context AppVeyor::Client do
  describe 'Create Environment' do
    before :each do
      @environment = AppVeyor::Client.new()
    end

    it 'should be able to create an environment' do
      expect(@client).to respond_to(:create_environment)
    end

    it 'should return an environment' do
      VCR.use_cassette('create environment cassette') do
        expect(@client.create_environment(@environment)).to be_an_instance_of(AppVeyor::Environment)
      end
    end
  end
end
