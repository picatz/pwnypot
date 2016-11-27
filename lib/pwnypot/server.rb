require 'pry'
module Pwnypot

  # The Server class that does the majority
  # of the logic for this gem. Logging as a 
  # mixin to provide logging for this class.
  class Server
    attr_accessor :port
    attr_accessor :banner
    attr_accessor :log
    attr_accessor :rainbows
    
    # When a new Server is created, it sets
    # everything false by default
    def initialize(options=false)
      @port = false
      @banner = false
      @log = false
      @rainbows = false
      setup(options) if options
    end

    def setup(options=false)
      if options
        @port = options[:port] || 8080
        @banner = options[:banner] || 'MS-IIS WEB SERVER 5.0'
        @log = true if options[:logging]
        if options[:rainbows]
          require 'lolize/auto'
          @rainbows = true
        end 
      end
      @port = 8080 unless @port
      @banner = 'MS-IIS WEB SERVER 5.0' unless @banner
      @log = false unless @log
      @rainbows = false unless @rainbows
      true 
    end

    def start
      unless @port and @banner
        Pwnypot.logger.error("FAILED to start pwnypot. Need both a banner and a port.") if @log
        PwnypotError.new("Need both a port and a banner to start a pwnypot up!") 
      end
      Pwnypot.logger.info("STARTING pwnypot on PORT: #{@port} with BANNER: #{@banner}") if @log
      server = TCPServer.new(@port)
      server.listen(1)
      loop do
        begin
          Thread.fork(server.accept) do |client| 
            begin
              r_port, r_ip = Socket.unpack_sockaddr_in(client.getpeername)
              Pwnypot.logger.warn("CAUGHT on PORT: #{@port} -- #{r_ip}:#{r_port}") if @log
              client.puts @banner
              client.close
            ensure 
              client.close
            end
          end
        rescue => e
          Pwnypot.logger.error("#{e}") if @log
        end
      end
    end
  end 

end
