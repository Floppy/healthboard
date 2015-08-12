[![Build Status](http://img.shields.io/travis/Floppy/healthboard.svg)](https://travis-ci.org/Floppy/healthboard)
[![Dependency Status](http://img.shields.io/gemnasium/Floppy/healthboard.svg)](https://gemnasium.com/Floppy/healthboard)
[![Coverage Status](http://img.shields.io/coveralls/Floppy/healthboard.svg)](https://coveralls.io/r/Floppy/healthboard)
[![Code Climate](http://img.shields.io/codeclimate/github/Floppy/healthboard.svg)](https://codeclimate.com/github/Floppy/healthboard)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://Floppy.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

# healthboard

A health-tracking dashboard

## Running the app

```
bundle
bundle exec rackup config.ru
```

## Authentication

The first time you run the app, you'll need to authenticate to Fitbit.

 * Register an app at https://dev.fitbit.com/apps. It should be a desktop/server read-only app for now.
 * Get the consumer key and consumer secret for your app
 * Run `rake fitbit:auth[<consumer_key>,<consumer_secret>]` and follow the instructions.
 * The rake task sets the required information in `.env`, and you should be good to go.
 
 ## Running on Heroku
 
 Deployment to Heroku is done as for any other app; you just need to set the authentication variables in `.env` as environment variables in the heroku app dashboard.