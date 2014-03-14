require 'yaml'

module CampfireNotifier
  module Config
    extend self

    def get
      @notifier ||= YAML.load(File.read(ENV['CAMPFIRE_NOTIFIER_CONFIG']))
    end

    def campfire_subdomain
      ENV['CAMPFIRE_SUBDOMAIN']
    end

    def campfire_token
      ENV['CAMPFIRE_TOKEN']
    end
  end
end