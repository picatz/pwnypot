module Pwnypot
  def logger
    Logging.logger
  end

  def self.logger
    @logger ||= Logger.new "#{Time.new.to_s.split(" ")[1]}_honeypot.log"
  end
end

