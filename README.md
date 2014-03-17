# Campfire Notifier

Provides notifications based on configurable triggers for your Campfire rooms. Notifications can be sent using:

* Twilio
* Pushover

## Configuration

All configuration is done in `config/config.yml`. If needed, you can change the configuration file location by overriding it with the `CAMPFIRE_NOTIFIER_CONFIG` environment variable.

The config file looks like this:

``` yaml
# How often we should check the campfire rooms for updates
schedule: 1m

# The default notification service. Can be overriden per user.
notification_service: Twilio

# The campfire credentials
campfire:
  subdomain: awesome-co
  api_token: 02ed8f207b2935fo37bnasf17b7c479408fb37687

# Twilio credentials (if applicable)
twilio:
  account_sid: ACe40lN63sb0d5273ef8ej1a98ad0159ff
  auth_token: 69d9KnYT5b539aa1a7eVB4S6f0e835f3
  phone_number: +1 123-456-7890

# Pushover credentials (if applicable)
pushover:
  title: My Company Chat
  api_token: aX0pL7Hb5rBPC8W5fPfqkVjHYix6H2

# People we want to notify
people:
  Ryan:
    notification_service: Pushover
    pushover_token: eadz98FTGzPZJI87HbzX8RuXz9EP9h
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