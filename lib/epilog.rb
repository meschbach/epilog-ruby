require "epilog/version"

module Epilog
	class UnificationGoal
		def initialize( leftSide, rightSide )
			@leftSide = leftSide
			@rightSide = rightSide
		end

		def solve
			if @leftSide.ground?
				@leftSide.value == @rightSide.value
			else
				@leftSide.materialize( @rightSide.value )
				true
			end
		end
	end

	class Variable
		def initialize( value = nil )
			@value = value
		end

		def ground?
			!@value.nil?
		end

		def materialize( value )
			@value = value
		end

		def value
			@value
		end
	end
end
