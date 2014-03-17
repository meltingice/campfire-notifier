module CampfireNotifier
  module Service
    class Pushover < Base
      has_config :pushover

      def notify!
        CampfireNotifier.logger.info "Notifying #{person.name} via push notification"
        CampfireNotifier.logger.info formatted_message

        ::Pushover.notification({
          title: config['title'],
          message: formatted_message,
          user: person.config['pushover_token'],
          token: config['api_token']
        })
      end
    end
  end
end