module CampfireNotifier
  extend self

  def logger
    return @logger if @logger
    @logger = Logger.new(STDOUT)
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}] #{datetime.to_s} - #{msg}\n"
    end

    @logger
  end
end