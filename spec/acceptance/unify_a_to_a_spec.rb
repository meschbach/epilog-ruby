require 'epilog'

describe "'a' = 'a'." do
	it "should be true" do
		goal = Epilog::UnificationGoal.new( Epilog::Variable.new( 'a' ), Epilog::Variable.new( 'a' ) )
		goal.solve.should be_true
	end
end
