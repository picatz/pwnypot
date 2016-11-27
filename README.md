# Pwnypot
#### ⚠️  Warning : Still in development! 

Pwnypot is meant to provide a simple, multithreaded honey pot ruby library. With logging and rainbow options.

## Installation

    $ gem install pwnypot

## Usage

Things may change in the future, but for now: basic useage:

```ruby
require 'pwnypot'

# make new server
server = Pwnypot::Server.new

# automagic setup
server.setup

# CTRL+C interupt is helpful 
trap("SIGINT") { puts "pwnypot server shutting down"; exit; }

# start the honeypot
server.start

```

### Local Testing with Netcat

You can use something like netcat to test that the honeypot is working. Be default with `.setup()`, the honeypot will setup on port `8080` with a `MS-IIS WEB SERVER 5.0` -- and we want to verify that behavior.

```
$ nc localhost 8080
MS-IIS WEB SERVER 5.0
$ echo "Cool, worked!"
Cool, worked!
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

