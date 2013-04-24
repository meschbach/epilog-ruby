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

		context "#associate" do
			let( :friend ){ Epilog::Variable.new }

			before { variable.associate( friend ) }

			context "when assigns a value to self" do
				let( :value ){ "molecule" }

				before { variable.materialize( value ) }

				it "also provides the value for friend" do
					friend.value.should == value
				end
			end

			context "when assigns value to friend" do
				let( :value ){ "moon" }

				before { friend.materialize( value ) }

				it "also assigns values for me" do
					variable.value.should == value
				end
			end

			context "when our friend is associated" do
				let( :other_variable ){ Epilog::Variable.new( "c" ) }

				it "has the correct value" do
					friend.associate( other_variable )
					variable.value.should == "c"
				end
			end
		end

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

describe Epilog::Term do
	let( :matter ){ Epilog::Term.new }

	context "upon construction" do
		it "should be unbound" do
			Epilog::Term.new.should_not be_ground
		end
	end

	context "#materialize" do
		let( :value ){ "clear" }

		before do
			matter.materialize( value )
		end

		it "should be ground" do
			matter.should be_ground
		end

		it "should have the resulting value" do
			matter.value.should == value
		end
	end

	describe "#value" do
		context "when free" do
			specify { 
				expect { matter.value }.to raise_error(Epilog::FreeVariableError) 
			}
		end

		context "when bound" do
			let( :value ){ "salt" }

			before { matter.materialize( value ) }
			specify {
				matter.value.should == value
			}
		end
	end
	
	describe "#constrained?" do
		it "initially isn't" do
			matter.should_not be_constrained
		end

		context "when constrained" do
			before { matter.constrained }

			specify { matter.should be_constrained }
		end
	end
end

