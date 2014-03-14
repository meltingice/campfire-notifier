require 'rake'

task :environment do
  require './lib/campfire-notifier'
end

namespace :notifier do
  task :watch => :environment do
    Rooms.new.watch!
  end
end