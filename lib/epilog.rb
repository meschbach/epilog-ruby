require "epilog/version"

module Epilog
	class UnificationGoal
		def initialize( leftSide, rightSide )
			@leftSide = leftSide
			@rightSide = rightSide
		end

		def solve
			@leftSide == @rightSide
		end
	end
end
