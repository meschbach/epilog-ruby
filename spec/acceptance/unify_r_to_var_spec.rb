require 'epilog'

describe "'r' = Var." do
	it "is solved" do
		var = Epilog::Variable.new
		v = Epilog::Variable.new( "r" )
		goal = Epilog::UnificationGoal.new( v, var )
		goal.solve.should be_true
		var.value.should == v.value
	end
end
