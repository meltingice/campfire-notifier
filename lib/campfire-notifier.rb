$LOAD_PATH << Dir.pwd

require 'bundler'
Bundler.require

require 'lib/campfire-notifier/ext/string'
require 'lib/campfire-notifier/config'
require 'lib/campfire-notifier/campfire'
require 'lib/campfire-notifier/person'
require 'lib/campfire-notifier/rooms'
require 'lib/campfire-notifier/room'