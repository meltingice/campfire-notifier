module CampfireNotifier
  module Twilio
    extend self

    def client
      @client ||= ::Twilio::REST::Client.new(
        Config.get['twilio_account_sid'], 
        Config.get['twilio_auth_token']
      )
    end

    def from_number
      Config.get['twilio_number']
    end
  end
end