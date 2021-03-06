require 'epilog'

describe "Var = 'v'." do
	it "is solved" do
		var = Epilog::Variable.new
		v = Epilog::Variable.new( "v" )
		goal = Epilog::UnificationGoal.new( var, v )
		goal.solve.should be_true
		var.value.should == v.value
	end
end
