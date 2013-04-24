require 'epilog'

describe Epilog::Statement do
	it "invokes given goals" do
		test_goal = double( "Test Goal" )
		test_goal.should_receive( :solve ).and_return( true )

		statement = Epilog::Statement.new
		statement.add_goal test_goal
		statement.solve
	end
end

