module CampfireNotifier
  class Room
    def initialize(room)
      @room = room
    end

    def method_missing(meth, *args, &block)
      @room.send(meth, *args, &block)
    end

    def last_checked_at
      
    end
  end
end