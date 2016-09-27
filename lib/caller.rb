# frozen_string_literal: true
require_relative 'appveyor-api'

config = AppveyorConfig.new('damacus', 'chef-appveyor-ci-cookbook', 'igxqsfp89dnu3xi1')

start_deployment(config)
