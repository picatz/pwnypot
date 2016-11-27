module Pwnypot
	# PwnypotError handles the custom error handling for this Gem
	#
	# == Example
	#
	#  # Typical use case
	#  raise PwnypotError.new("This is a custom error!")
	#
	class PwnypotError < StandardError
		attr_reader :problem
		def initialize(problem="Pwnypot seems to have encountered a problem.")
			@problem = problem
			super(@problem)
		end
	end
end
