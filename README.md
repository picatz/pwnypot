# Pwnypot
#### ⚠️  Warning : Still in development! 

A simple, multithreaded honeypot creation library for Ruby. 

## Installation

Once I have taken this out of development, it will be a gem. For now you need to get it from here on github.

    $ git clone https://github.com/picatz/pwnypot.git

### In the Future, a Gem 

When I release version 1.0.0, it will be a gem:

    $ gem install pwnypot

## Usage

This honeypot, by default is pretty barebones. 

### Default Setup

The typical setup setup a honeypot on port `8080` and has a banner of `MS-IIS WEB SERVER 5.0`. It's an automagic setup.

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

#### Local Testing with Netcat

You can use something like netcat to test that the honeypot is working. Be default with `.setup()`, the honeypot will setup on port `8080` with a `MS-IIS WEB SERVER 5.0` -- and we want to verify that behavior.

```
$ nc localhost 8080
MS-IIS WEB SERVER 5.0
$ echo "Cool, worked!"
Cool, worked!
```

### Custom Messages

You can set a banner ( or not ) and you can even bring your own strings for the honeypot. 

So, if you wanted something that looked like this on port `8080`:

```
HTTP/1.1 200 OK
X-XSS-Protection: 1; mode=block
Server: thin
```

You just need to do this:

```ruby
require 'pwnypot'

# create a new server
# it has an atrribute, "mesgs" -- 
# this is an array of the mesgs you want
# to display to the user after the banner,
# otherwise, if there isn't a banner, it'll just
# spit out the the messages you added.
server = Pwnypot::Server.new

# add your strings, sort of imitating a thin web server
server.add_mesg("HTTP/1.1 200 OK")
server.add_mesg("X-XSS-Protection: 1; mode=block")
server.add_mesg("Server: thin")

# set the port
server.port = 8080

# start the honeypot
server.start
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

