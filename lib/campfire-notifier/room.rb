module CampfireNotifier
  class Room
    def initialize(room)
      @room = room
      @last_message_id = nil
    end

    def method_missing(meth, *args, &block)
      @room.send(meth, *args, &block)
    end

    def check!
      CampfireNotifier.logger.info "Checking #{@room.name}..."
      messages = @room.recent(limit: 50, since_message_id: @last_message_id)
      messages.each do |msg|
        check_for_notifications(msg)
      end

      return if messages.size == 0
      @last_message_id = messages.last.id
    end

    private

    def check_for_notifications(message)
      Config.people.each do |person|
        if person.triggered_by?(message.body)
          person.notify!(self, message)
        end
      end
    end
  end
end