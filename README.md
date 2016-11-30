[![CircleCI](https://circleci.com/gh/damacus/appveyor-api/tree/master.svg?style=svg)](https://circleci.com/gh/damacus/appveyor-api/tree/master)

# appveyor-api
A wrapper for the AppVeyor API

Inspiration from https://github.com/esaio/esa-ruby

# Example Usage
This client will accept either an `APPVEYOR_API_KEY` as an argument or detect an environment variable

### Environment Variable
`$APPVEYOR_API_KEY`

### Access_token
`@client = AppVeyor::Client.new(access_token:'123456787980nthrthrt)`

## List Environments
`@client.list_environments`

## List Projects
`@client.list_projects`

## Update Environment
`awesome_environment={"deploymentEnvironmentId":12168,"name":"production","provider":"FTP","settings":{"providerSettings":[{"name":"server","value":{"value":"ftp.server.com","isEncrypted":false}},{"name":"username","value":{"value":"ftp-user","isEncrypted":false}},{"name":"password","value":{"value":"password","isEncrypted":true}}],"environmentVariables":[{"name":"my-var","value":{"value":"123","isEncrypted":false}}]}}`

`@client.create_environment(awesome_environment)`
