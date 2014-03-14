module CampfireNotifier
  class Rooms
    include Enumerable

    def initialize
      @rooms = Campfire.client.rooms.map do |room|
        Room.new(room)
      end
    end

    def each(&block)
      @rooms.each(&block)
    end

    def watch!
      
    end
  end
end