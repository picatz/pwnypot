# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pwnypot/version'

Gem::Specification.new do |spec|
  spec.name          = "pwnypot"
  spec.version       = Pwnypot::VERSION
  spec.authors       = ["Kent Gruber"]
  spec.email         = ["kgruber1@emich.edu"]

  spec.summary       = %q{Pwny Pot is a command-line application and ruby API to create simple, multithreaded honey pots.}
  spec.description   = %q{Pwny Pot is a command-line application and ruby API to create simple, multithreaded honey pots with logging and rainbow options!}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.bindir        = "bin"
  spec.executable    = "pwnypot"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
