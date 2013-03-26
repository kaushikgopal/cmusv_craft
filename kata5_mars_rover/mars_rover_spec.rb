require_relative "./mars_rover"
# require "./mars_rover"

describe MarsRover do
  
  # You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
  let(:rover){MarsRover.new}
  
  it "should have starting coordinates [0,0]" do
    expect(rover.coordinates).to eql([0,0])
  end

  context "receives single commands" do
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

    context "EAST" do
      before(:each) do
        rover.direction = "E"
      end
      it "should move one position in the positive x coordinate for 'f'" do
        rover.coordinates = [3,3]
        rover.move(["f"])
        expect(rover.coordinates).to eql([4,3])
      end
      it "should move one position in the negative x coordinate for 'b'" do
        rover.coordinates = [2,2]
        rover.move(["b"])
        expect(rover.coordinates).to eql([1,2])
      end  
      it "should change the position to South when given 'r'" do
        rover.move(["r"])
        expect(rover.direction).to eql("S")
      end
      it "should change the position to North when given 'l'" do
        rover.move(["l"])
        expect(rover.direction).to eql("N")
      end
    end

    context "WEST" do
      before(:each) do
        rover.direction = "W"
      end
      it "should move one position in the negative x coordinate for 'f'" do
        rover.coordinates = [3,3]
        rover.move(["f"])
        expect(rover.coordinates).to eql([2,3])
      end
      it "should move one position in the positive x coordinate for 'b'" do
        rover.coordinates = [2,2]
        rover.move(["b"])
        expect(rover.coordinates).to eql([3,2])
      end  
      it "should change the position to North when given 'r'" do
        rover.move(["r"])
        expect(rover.direction).to eql("N")
      end
      it "should change the position to South when given 'l'" do
        rover.move(["l"])
        expect(rover.direction).to eql("S")
      end
    end
  end

  it "should recieve a character array of commands" do
    rover.move(["ffrff"])
    expect(rover.coordinates).to eql([2,2])
  end

  context "GRID WRAPPING" do
    before(:each) do
      rover.boundary = [100,100]
    end
    it "should wrap to the top of the grid if it goes below 0 for a South facing forward direction" do
      rover.direction = "S"
      rover.move(["f"])
      expect(rover.coordinates).to eql([0,100])
    end
    it "should wrap to the top of the grid if it goes below 0 for a North facing backward direction" do
      rover.direction = "N"
      rover.move(["b"])
      expect(rover.coordinates).to eql([0,100])
    end
    it "should wrap to the bottom of the grid it goes above boundary for a North facing forward direction" do
      rover.coordinates = [4,100]
      rover.direction = "N"
      rover.move(["f"])
      expect(rover.coordinates).to eql([4,0])
    end
    it "should wrap to the bottom of the grid it goes above boundary for a South facing backward direction" do
      rover.coordinates = [4,100]
      rover.direction = "S"
      rover.move(["b"])
      expect(rover.coordinates).to eql([4,0])
    end

    it "should wrap to the right of the grid if it goes below 0 for a West facing forward direction" do
      rover.direction = "W"
      rover.move(["f"])
      expect(rover.coordinates).to eql([100,0])
    end
    it "should wrap to the right of the grid if it goes below 0 for a East facing backward direction" do
      rover.direction = "E"
      rover.move(["b"])
      expect(rover.coordinates).to eql([100,0])
    end
    it "should wrap to the left of the grid if it goes above boundary for a East facing forward direction" do
      rover.coordinates = [100,4]
      rover.direction = "E"
      rover.move(["f"])
      expect(rover.coordinates).to eql([0,4])
    end
    it "should wrap to the left of the grid if it goes above boundary for a West facing backward direction" do
      rover.coordinates = [100,4]
      rover.direction = "W"
      rover.move(["b"])
      expect(rover.coordinates).to eql([0,4])
    end
  end

end
