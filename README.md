[![CircleCI](https://circleci.com/gh/damacus/appveyor-api/tree/master.svg?style=svg)](https://circleci.com/gh/damacus/appveyor-api/tree/master)

# appveyor-api
A wrapper for the AppVeyor API

Inspiration from
https://github.com/esaio/esa-ruby

# Usage
Environment Variable $APPVEYOR_API_KEY
@client = AppVeyor::Client.new(access_token:'<insert_your_api_key_here')
