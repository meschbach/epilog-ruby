require "epilog/version"

module Epilog
	class UnificationGoal
		def initialize( left_side, right_side )
			@left_side = left_side
			@right_side = right_side
		end

		def solve
			if @left_side.ground?
				if @right_side.ground?
					@left_side.value == @right_side.value
				else
					@right_side.materialize( @left_side.value )
					true
				end
			else
				@left_side.materialize( @right_side.value )
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
