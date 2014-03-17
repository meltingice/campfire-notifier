$LOAD_PATH << Dir.pwd

require 'bundler'
Bundler.require

require 'logger'

require 'lib/campfire-notifier/ext/string'
require 'lib/campfire-notifier/config'
require 'lib/campfire-notifier/logger'
require 'lib/campfire-notifier/campfire'
require 'lib/campfire-notifier/person'
require 'lib/campfire-notifier/room'
require 'lib/campfire-notifier/rooms'
require 'lib/campfire-notifier/service'
require 'lib/campfire-notifier/services/base'
require 'lib/campfire-notifier/services/pushover'
require 'lib/campfire-notifier/services/twilio'