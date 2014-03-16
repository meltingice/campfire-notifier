require 'rake'

task :environment do
  require './lib/campfire-notifier'
end

namespace :notifier do
  desc "Starts listening for notification triggers"
  task :listen => :environment do
    CampfireNotifier::Rooms.listen!
  end

  desc "Checks all rooms for a notification trigger and exits"
  task :check => :environment do
    CampfireNotifier::Rooms.new(always_notify: true).each(&:check!)
  end
end