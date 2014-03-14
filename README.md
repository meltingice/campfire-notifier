# Campfire Notifier

Provides SMS notifications for your Campfire rooms using Amazon SNS. Notifications are sent based on configurable triggers.

## Configuration

All configuration is done in `config/config.yml`. If needed, you can change the configuration file location by overriding it with the `CAMPFIRE_NOTIFIER_CONFIG` environment variable.

The config file looks like this:

``` yaml
# How often we should check the campfire rooms for updates
schedule: 1m

# The campfire credentials
campfire_subdomain: awesome-co
campfire_token: 02ed8f207b2935fo37bnasf17b7c479408fb37687

# Array of people we want to notify
people:
  Ryan:
    phone: +1 (123) 456-7890
    triggers:
      - RL
      - Ryan
      - LeFevre
  Kelly:
    phone: +1 (890) 123-4567
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