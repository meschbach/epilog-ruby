require 'epilog'

describe " V = X, X = 'c'." do
	let( :v ){ Epilog::Variable.new }
	let( :x ){ Epilog::Variable.new }
	let( :atom_c ){ Epilog::Variable.new( 'c' ) }
	let( :unify_v_x ){ Epilog::UnificationGoal.new( v, x ) }
	let( :unify_x_atom_c ){ Epilog::UnificationGoal.new( x, atom_c ) }
	let( :statement ){
		statement = Epilog::Statement.new
		statement.add_goal unify_v_x
		statement.add_goal unify_x_atom_c
		statement
	}

	it "is proven" do
		statement.solve.should be_true
	end

	it "V has the value 'c'" do
		statement.solve
		v.value.should == 'c'
	end
end

