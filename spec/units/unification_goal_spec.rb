require 'epilog'

describe Epilog::UnificationGoal do
	context "with left input unbound and right input is ground" do
		let( :left ){ Epilog::Variable.new }
		let( :right_value ){ "bound" }
		let( :right ){ Epilog::Variable.new( right_value ) }
		let( :goal ){ Epilog::UnificationGoal.new( left, right ) }

		it "is proven" do
			goal.solve.should be_true
		end

		context "with the left variable" do
			before { goal.solve }

			it "is ground" do
				left.should be_ground
			end
			it "materialized as the right value" do
				left.value.should == right_value
			end
		end
		it "grounds the left variable" do
			goal.solve
			left.should be_ground
		end

		it "grounds the left variable to the value" do
			goal.solve
			left.should be_ground
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
end

