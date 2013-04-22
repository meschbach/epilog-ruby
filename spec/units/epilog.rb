require 'epilog'

describe Epilog::Variable do
	it "is bound when initialized with a value" do
		variable = Epilog::Variable.new( "some value" )
		variable.should be_ground
	end

	it "is free when not initialized with a value" do
		variable = Epilog::Variable.new
		variable.should_not be_ground
	end

	context "when ground" do
		it "returns the value" do
			variable = Epilog::Variable.new( 42 )
			variable.value.should == 42
		end
	end

	context "when unbound" do
		let( :variable ){ Epilog::Variable.new }
		context "#materialize" do
			let( :value ){ "Ice Cream" }

			before do
				variable.materialize( value )
			end

			it "grounds the variable" do
				variable.value.should == value
			end
		end
	end
end

