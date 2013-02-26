require "rspec"
require "./vending_machine.rb"

describe "Vending Machine" do
  before(:all) do
    @vm = VendingMachine.new()
    @denomination_array = [1, 5, 10, 25, 100]
  end

  it "should have a method that takes in three parameters" do
  	@vm.should respond_to(:get_num_of_coins).with(2).arguments
  end
  it "should return all 0s for 0" do
  	expect(		@vm.get_num_of_coins( 0, 
																		@denomination_array)).to eql(	
																		[0, 0, 0, 0, 0] )
  end

  it "should return [0, 1, 1, 0, 0] for an input of 15" do
		expect(		@vm.get_num_of_coins( 15, 
																		@denomination_array)).to eql(	
																		[0, 1, 1, 0, 0] )
  end
  it "should return [0, 1, 1, 1, 0] for an input of 40" do
		expect(		@vm.get_num_of_coins( 40, 
																		@denomination_array)).to eql(	
																		[0, 1, 1, 1, 0] )
  end
  it "should return [3, 0, 2, 0, 4] for an input of 423" do
		expect(		@vm.get_num_of_coins( 423, 
																		@denomination_array)).to eql(	
																		[3, 0, 2, 0, 4] )
  end


end