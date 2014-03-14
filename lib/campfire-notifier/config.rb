require 'yaml'

module CampfireNotifier
  module Config
    extend self

    def get
      @notifier ||= YAML.load(File.read(ENV['CAMPFIRE_NOTIFIER_CONFIG'] || 'config/config.yml'))
    end

    def people
      @people ||= get['people'].map do |name, config|
        Person.new(name, config)
      end
    end

    def campfire_subdomain
      get['campfire_subdomain']
    end

    def campfire_token
      get['campfire_token']
    end
  end
end