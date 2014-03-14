module CampfireNotifier
  module Campfire
    extend self

    def client
      @client ||= ::Tinder::Campfire.new(
        Config.campfire_subdomain,
        { token: Config.campfire_token }
      )
    end
  end
end