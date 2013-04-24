require 'epilog'

describe Epilog::UnificationGoal do
	let( :bound_value ){ "bound" }
	let( :bound_variable ){ Epilog::Variable.new( bound_value ) }
	let( :variable ){ Epilog::Variable.new }

	context "with left input unbound and right input is ground" do
		let( :goal ){ Epilog::UnificationGoal.new( variable, bound_variable ) }

		it "is proven" do
			goal.solve.should be_true
		end

		context "with the left variable" do
			before { goal.solve }

			it "is ground" do
				variable.should be_ground
			end
			it "materialized as the right value" do
				variable.value.should == bound_value
			end
		end
		it "grounds the left variable" do
			goal.solve
			variable.should be_ground
		end

		it "grounds the left variable to the value" do
			goal.solve
			variable.should be_ground
		end
	end

	context "with the left value bound and right is free" do
		let( :goal ){ Epilog::UnificationGoal.new( bound_variable, variable ) }

		it "is proven true" do
			goal.solve.should be_true
		end

		context "for the right variable" do
			before { goal.solve }
			it "is bound" do
				variable.should be_ground
			end

			it "comoses the two variables from the same matter" do
				variable.matter.should == bound_variable.matter 
			end
		end
	end

	it "is true when the left input is unbound and the right is bound" do
		left = Epilog::Variable.new
		right = Epilog::Variable.new( "bound" )

		goal = Epilog::UnificationGoal.new( left, right )
		goal.solve.should be_true
	end

	context "with bound inputs" do
		it "is true when the left and right values are equal" do
			goal = Epilog::UnificationGoal.new( Epilog::Variable.new( "side" ), Epilog::Variable.new( "side" ) )
			goal.solve.should be_true
		end

		it "is false when the left and right avlues are not equal" do
			goal = Epilog::UnificationGoal.new( Epilog::Variable.new( "left" ), Epilog::Variable.new( "right" ) )
			goal.solve.should be_false
		end
	end

	context "with both inputs unbound" do
		let( :other_variable ){ Epilog::Variable.new }
		let( :goal ){ Epilog::UnificationGoal.new( variable, other_variable ) }

		it "associates the variables" do
			goal.solve
			other_variable.matter.should == variable.matter
		end
	end
end

