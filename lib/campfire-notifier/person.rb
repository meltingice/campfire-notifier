module CampfireNotifier
  class Person
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
      message = "[#{room.name}] #{message.user.name}: #{message.body}".truncate(140)
      
      puts "Notifying #{@name} at #{@phone}:"
      puts message

      Twilio.client.account.messages.create({
        from: Twilio.from_number,
        to: @phone,
        body: message
      })
    end
  end
end