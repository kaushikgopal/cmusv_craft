require "rspec"
require "./vending_machine.rb"

describe "Vending Machine" do
  
  before(:all) do
    @vm = VendingMachine.new()
  end

  it "should have a method that takes in three parameters" do
  	@vm.should respond_to(:get_num_of_coins).with(2).arguments
  end  	
  
  {
  	0 => [0, 0, 0, 0, 0],
  	15 => [0, 1, 1, 0, 0],
  	40 => [0, 1, 1, 1, 0],
  	100 => [0, 0, 0, 0, 1],
  	423 => [3, 0, 2, 0, 4]
  }.each do |amount, output_array|
		it "should return #{output_array} for an input of #{amount}" do
			expect(		@vm.get_num_of_coins( amount, 
																			[1, 5, 10, 25, 100])).to eql(	
																			output_array )
		end
  end

end