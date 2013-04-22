require 'epilog'

describe "'a' = 'a'." do
	it "should be true" do
		goal = Epilog::UnificationGoal.new( 'a', 'a' )
		goal.solve.should be_true
	end
end
