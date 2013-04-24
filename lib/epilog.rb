require "epilog/version"
require "epilog/variable"

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
					@right_side.associate( @left_side )
					true
				end
			else
				@left_side.associate( @right_side )
				true
			end
		end
	end

	class Statement
		def initialize( )
			@goals = []
		end

		def add_goal( a_goal )
			@goals << a_goal
		end

		def solve
			@goals.map do |goal|
				goal.solve
			end
		end
	end
end
