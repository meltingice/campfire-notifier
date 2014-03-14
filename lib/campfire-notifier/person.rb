module CampfireNotifier
  class Person
    def initialize(name, config)
      @name = name
      @phone = config['phone']
      @triggers = config['triggers'].map do |t|
        Regexp.new("\b#{t}\b")
      end
    end

    def triggered_by?(message)
      @triggers.each do |trigger|
        return true if message =~ trigger
      end

      false
    end

    def notify!(message)
      puts "Notifying #{@name} at #{@phone}:"
      puts message
    end
  end
end