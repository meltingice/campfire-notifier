module CampfireNotifier
  module Service
    class Twilio < Base
      has_config :twilio
    
      def notify!
        CampfireNotifier.logger.info "Notifying #{person.name} at #{phone_number}:"
        CampfireNotifier.logger.info formatted_message

        client.account.messages.create({
          from: config['phone_number'],
          to: phone_number,
          body: formatted_message.truncate(140)
        })
      end

      private

      def phone_number
        person.config['phone']
      end

      def client
        @client ||= ::Twilio::REST::Client.new(
          config['account_sid'], 
          config['auth_token']
        )
      end
    end
  end
end