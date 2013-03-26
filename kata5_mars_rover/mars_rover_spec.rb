require_relative "./mars_rover"
# require "./mars_rover"

describe MarsRover do
  let(:rover){MarsRover.new}
  
  it "should have starting coordinates [0,0]" do
  	expect(rover.coordinates).to eql([0,0])
  end

  it "should have a grid/planet/world/boundary definition"


  describe "receives single commands" do
    context "NORTH" do
      before(:each) do
        rover.direction = "N"
      end
      it "should move one position in the positive y coordinate for 'f'" do
        rover.coordinates = [3,3]
        rover.move(["f"])
        expect(rover.coordinates).to eql([3,4])
      end  
      it "should move one position in the negative y axis for 'b'" do
        rover.coordinates = [3,3]
        rover.move(["b"])
        expect(rover.coordinates).to eql([3,2])
      end
      it "should change the position to East when given 'r'" do
        rover.move(["r"])
        expect(rover.direction).to eql("E")
      end
      it "should change the position to West when given 'l'" do
        rover.move(["l"])
        expect(rover.direction).to eql("W")
      end
    end

    context "SOUTH" do
      before(:each) do
        rover.direction = "S"
      end
      it "should move one position in the negative y coordinate for 'f'" do
        rover.coordinates = [3,3]
        rover.move(["f"])
        expect(rover.coordinates).to eql([3,2])
      end  
      it "should move one position in the positive y axis for 'b'" do
        rover.coordinates = [3,3]
        rover.move(["b"])
        expect(rover.coordinates).to eql([3,4])
      end
      it "should change the position to West when given 'r'" do
        rover.move(["r"])
        expect(rover.direction).to eql("W")
      end
      it "should change the position to East when given 'l'" do
        rover.move(["l"])
        expect(rover.direction).to eql("E")
      end
    end

  end

  # The rover receives a character array of commands. [ffrff]
  context "should recieve a character array of commands" do
  end
  


  # Implement wrapping from one edge of the grid to another. (planets are spheres after all)
  it "shoud wrap around the grid"



  # You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
  it "should have a command to set current position" do
    rover.coordinates = [10,10]
    expect(rover.coordinates).to eql([10,10])
  end



end

    
# Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.
# Example: The rover is on a 100x100 grid at location (0, 0) and facing NORTH. The rover is given the commands "ffrff" and should end up at (2, 2)
# Tips: use multiple classes and TDD
