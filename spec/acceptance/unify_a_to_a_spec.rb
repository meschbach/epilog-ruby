describe "'a' = 'a'." do
	it "should be true" do
		goal = Epilog::UnificationGoal.new( 'a', 'a' )
		goal.solve proof
		proof.should be_proven
	end
end
