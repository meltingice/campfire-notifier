module CampfireNotifier
  module Service
    class Base
      def self.has_config(name)
        define_method(:config) { Config.get[name.to_s] }
      end

      attr_reader :person, :room, :message

      def initialize(person, room, message)
        @person = person
        @room = room
        @message = message
      end

      def notify!
        raise "Must override"
      end

      def formatted_message
        "[#{room.name}] #{triggered_by_user}: #{message.body}"
      end

      def triggered_by_user
        message.user.name
      end
    end
  end
end