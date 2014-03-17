module CampfireNotifier
  class Person
    attr_reader :name, :config

    def initialize(name, config)
      @name = name
      @config = config
      @triggers = config['triggers'].map do |t|
        Regexp.new("\\b#{t}\\b")
      end
    end

    def triggered_by?(message)
      @triggers.each do |trigger|
        return true if message =~ trigger
      end

      false
    end

    def notify!(room, message)
      Service.for(self).new(self, room, message).notify!
    end
  end
end