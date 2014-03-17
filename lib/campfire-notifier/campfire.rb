module CampfireNotifier
  module Campfire
    extend self

    def client
      @client ||= ::Tinder::Campfire.new(subdomain, token: token)
    end

    private

    def subdomain
      Config.get['campfire']['subdomain']
    end

    def token
      Config.get['campfire']['api_token']
    end
  end
end