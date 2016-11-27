$: << File.expand_path("../../lib", __FILE__)
require 'pwnypot'

# make new server
server = Pwnypot::Server.new

# setup server on port 5050
server.port = 5050

# do the rest of the setup automatically ( set banner )
server.setup

# CTRL+C Interupt 
trap("SIGINT") { puts "pwnypot server shutting down"; exit; }

# start the honeypot
server.start

