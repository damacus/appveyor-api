require_relative 'appveyor-api'
require 'json'
require 'yaml'

# config = AppveyorConfig.new('js-devops', 'bonus', 'mwjoyvvo72eaqpkxjdtx')
config = AppveyorConfig.new('js-devops', 'psm-archive', 'mwjoyvvo72eaqpkxjdtx')

# env_config = YAML.load(File.read("yaml_env.yml"))

# puts JSON.pretty_generate(env_config)
# puts env_config.to_json
# puts "---------\n\n"

# add_environment(config, env_config)

# puts JSON.pretty_generate(get_project_last_build(config))

# puts JSON.pretty_generate(get_environments(config))
# json =  JSON.pretty_generate(get_environment_settings(config, 8174))
# File.write('psm-archive-production.json', json)
# puts JSON.pretty_generate(get_environment_deployments(config, 8174))

# get_environment_names(config)
start_deployment(config)
