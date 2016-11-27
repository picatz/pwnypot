require 'pry'
module Pwnypot

  # The Server class that does the majority
  # of the logic for this gem. Logging as a 
  # mixin to provide logging for this class.
  class Server
    attr_accessor :port
    attr_accessor :banner
    attr_accessor :mesgs
    attr_accessor :rainbows

    def initialize(options=false)
      @port = false
      @banner = false
      @rainbows = false
      @mesgs = false
      #setup(options) if options
      if options
        setup_port(options[:port]) if options[:port]
        setup_banner(options[:banner]) if options[:banner]
        setup_rainbows(options[:rainbows] || options[:rainbow]) if options[:rainbows] || options[:rainbow]
      end
      true
    end

    def setup(options={})
      setup_port(options[:port])
      setup_banner(options[:banner])
      setup_rainbows(options[:rainbows] || options[:rainbow])
      true 
    end

    def setup_port(port=false)
      if port
        @port = port
      else
        @port = 8080
      end
      true
    end

    def setup_banner(banner=false)
      if banner
        @banner = banner
      else
        @banner = "MS-IIS WEB SERVER 5.0"
      end
      true
    end

    def setup_logging(log=false)
      if log
        @log = true
      else
        @log = false
      end
    end

    def setup_rainbows(rainbows=false)
      if rainbows
        require 'lolize/auto'
        @rainbows = true
      else
        @rainbows = false
      end
    end

    def add_mesg(mesg)
      @mesgs = [] unless @mesgs
      @mesgs << mesg
    end

    def start
      ensure_port_set
      server = TCPServer.new(@port)
      server.listen(1)
      loop do
        begin
          Thread.fork(server.accept) do |client| 
            begin
              r_port, r_ip = Socket.unpack_sockaddr_in(client.getpeername)
              client.puts @banner if @banner
              if @mesgs and @mesgs.is_a? Array
                @mesgs.each { |msg| client.puts msg } unless @mesgs.empty?
              end
              client.close
            rescue => e
              # do something with error
            ensure 
              client.close
            end
          end
        rescue => e
          # do something with error
        end
      end
    end

    private

    def ensure_port_set
      unless @port
        raise PwnypotError.new("Need to specify a port / setup with defaults to start!") 
      end
    end

  end 

end
