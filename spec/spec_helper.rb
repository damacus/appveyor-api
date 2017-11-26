# frozen_string_literal: true
require 'appveyor-api'
require 'rspec'
# require 'webmock/rspec'
require 'vcr'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.run_all_when_everything_filtered = true
  config.default_formatter = 'doc' if config.files_to_run.one?

  config.disable_monkey_patching!
  config.color = true
  config.tty = true
  config.formatter = :documentation

  # config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { record: :new_episodes }
  c.allow_http_connections_when_no_cassette = true
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<APPVEYOR_API_KEY>') { ENV['APPVEYOR_API_KEY'] }
end
