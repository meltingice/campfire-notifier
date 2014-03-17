module CampfireNotifier
  class Person
    attr_reader :name, :phone

    def initialize(name, config)
      @name = name
      @phone = config['phone']
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
      Service.active.new(self, *args).notify!
    end
  end
end