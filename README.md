# Campfire Notifier

Provides SMS notifications for your Campfire rooms using Twilio. Notifications are sent based on configurable triggers.

## Configuration

All configuration is done in `config/config.yml`. If needed, you can change the configuration file location by overriding it with the `CAMPFIRE_NOTIFIER_CONFIG` environment variable.

The config file looks like this:

``` yaml
# How often we should check the campfire rooms for updates
schedule: 1m

# The campfire credentials
campfire_subdomain: awesome-co
campfire_token: 02ed8f207b2935fo37bnasf17b7c479408fb37687

# The Twilio credentials
twilio_account_sid: ACe40lN63sb0d5273ef8ej1a98ad0159ff
twilio_auth_token: 69d9KnYT5b539aa1a7eVB4S6f0e835f3
twilio_number: +1 123-456-7890

# Array of people we want to notify
people:
  Ryan:
    phone: +1 123-456-7890
    triggers:
      - RL
      - Ryan
      - LeFevre
  Kelly:
    phone: +1 890-123-4567
    triggers:
      - KS
      - Kelly
      - Sutton
```

## Running

To start listening in your Campfire rooms, simply run:

``` shell
bundle exec rake notifier:listen
```