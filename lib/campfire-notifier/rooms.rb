module CampfireNotifier
  class Rooms
    include Enumerable

    def self.listen!
      self.new.listen!
    end

    def initialize(opts = {})
      @scheduler = Rufus::Scheduler.new
      @rooms = Campfire.client.rooms.map do |room|
        Room.new(room, opts)
      end
    end

    def each(&block)
      @rooms.each(&block)
    end

    def listen!
      CampfireNotifier.logger.debug "Starting schedule..."
      @scheduler.every(Config.get['schedule']) do
        @rooms.each do |room|
          room.check!
        end
      end

      @scheduler.join
    end
  end
end