require 'environments'

describe 'Environments' do
  before(:each) do
    @environments = Environments.new()
  end

  it 'should be searchable' do
    expect(@environments).to respond_to(:find_by_name)
  end

  it 'should return an environment' do
    expect(@environments.find_by_name('link-development')).to be_an_instance_of(Environment)
  end
end

describe 'Environment' do
  describe 'Simons Environment' do
    before :each do
      @environment = Environment.new()
      @environment.name = 'Simon'
    end
    it 'should have a name' do
      expect(@environment).to respond_to(:name)
      expect(@environment.name).to match('Simon')
    end
  end

  describe 'Test Environment' do
    before :each do
      @environment = Environment.new({"deploymentEnvironmentId" => 9052,
                                      "accountId" => 56787,
                                      "provider" => "Agent",
                                      "name" => 'Test',
                                      "settings" =>
                                      { "providerSettings" =>
                                        [{
                                          "name" => "test_setting",
                                          "value" => {
                                            "isEncrypted" =>false,
                                            "value" => "myaccount"
                                          }
                                        }]
                                      }
                                    })
    end
    it 'should have a name' do
      expect(@environment).to respond_to(:name)
      expect(@environment.name).to match('Test')
    end

    it 'should have an id' do
      expect(@environment.id).to match(9052)
    end

    it 'should have an account id' do
      expect(@environment.accountId).to match(56787)
    end

    it 'should have an Agent provider' do
      expect(@environment.provider).to match('Agent')
    end

    it 'should have an unencrypted Test Setting' do
      expect(@environment.settings[provider_settings].first[name]).to match("test_setting")
      expect(@environment.settings[provider_settings].first[value][value]).to match("myaccount")
      expect(@environment.settings[provider_settings].first[value][isEncrypted]).to match("false")
    end
  end
end
