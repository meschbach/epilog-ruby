require 'epilog'

describe Epilog::UnificationGoal do
	it "is true when the left and right values are equal" do
		goal = Epilog::UnificationGoal.new( "side", "side" )
		goal.solve.should be_true
	end

	it "is false when the left and right avlues are not equal" do
		goal = Epilog::UnificationGoal.new( "left", "right" )
		goal.solve.should be_false
	end
end

