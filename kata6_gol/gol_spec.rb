require_relative "cell"

describe "Game of Life" do

	context "Cell" do
		let(:cell) { Cell.new }

		it "should have a state"  do
			expect(cell.alive?).to eql(false)
			cell.alive = true
			expect(cell.alive?).to eql(true)
		end

		it "should have a location" do
			expect(cell.location).to eql([0,0])
			cell.location = [1,20]
			expect(cell.location).to eql([1,20])
		end

		it "should get neighbor locations" do
			neighbor_locations = [ [9,11],[10,11],[11,11],[9,10],[11,10],[9,9],[10,9],[11,9] ]
			cell.location = [10,10]
			cell.neighbor_locations.each do |x,y|
				expect(neighbor_locations.include? [x,y]).to eql(true)
			end
		end
	end


	context "Rules" do

		describe "alive cell" do
		  it ""
		  # Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
		end

		describe "dead cell" do
		  it "should description"
		end



	end

end