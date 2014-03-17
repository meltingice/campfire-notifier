module CampfireNotifier
  module Service
    class ServiceNotConfigured < StandardError; end

    extend self

    def active
      name = Config.get['notification_service']
      if name.nil?
        raise ServiceNotConfigured.new("Must specify a notification service in the config")
      end

      const_get(name)
    end
  end
end