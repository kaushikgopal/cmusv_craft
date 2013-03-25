require "./mars_rover"

describe MarsRover do
  let(:rover){MarsRover.new}
  it "should have starting coordinates [0,0]" do
  	expect(rover.coordinates).to eql([0,0])
  end
  it "should allow only one of the 4 directions N,S,E or W"
  it "should have a grid/planet/world/boundary definition"

  # You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
  it "should have a command to set current position"
  
  # The rover receives a character array of commands. [ffrff]
  it "should recieve a character array of commands"
  	# Implement commands that move the rover forward/backward (f,b).
    # Implement commands that turn the rover left/right (l,r).

  # Implement wrapping from one edge of the grid to another. (planets are spheres after all)
  it "shoud wrap around the grid"


end

    
# Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.
# Example: The rover is on a 100x100 grid at location (0, 0) and facing NORTH. The rover is given the commands "ffrff" and should end up at (2, 2)
# Tips: use multiple classes and TDD
