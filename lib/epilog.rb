require "epilog/version"

module Epilog
	class UnificationGoal
		def initialize( leftSide, rightSide )
			@leftSide = leftSide
			@rightSide = rightSide
		end

		def solve
			if @leftSide.ground?
				if @rightSide.ground?
					@leftSide.value == @rightSide.value
				else
					@rightSide.materialize( @leftSide.value )
					true
				end
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
