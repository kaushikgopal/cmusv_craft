require_relative "./mars_rover"

describe MarsRover do
  
  let(:rover){MarsRover.new}
  
  context "receives single commands" do
    it "should move correctly when pointing to the North direction" do
      [
        [[3,3], ["f"], [3,4], "N"],
        [[3,3], ["b"], [3,2], "N"],
        [[3,3], ["r"], [3,3], "E"],
        [[3,3], ["l"], [3,3], "W"]
      ].each do |coordinates, command, expected_position, expected_direction|
        rover.reset_rover_position
        rover.coordinates = coordinates
        
        rover.move(command)
        expect(rover.coordinates).to eql(expected_position)
        expect(rover.direction).to eql(expected_direction)
      end
    end

    it "should move correctly when pointing to the South direction" do
      [
        [[3,3], ["f"], [3,2], "S"],
        [[3,3], ["b"], [3,4], "S"],
        [[3,3], ["r"], [3,3], "W"],
        [[3,3], ["l"], [3,3], "E"]
      ].each do |coordinates, command, expected_position, expected_direction|
        rover.direction = "S"
        rover.coordinates = coordinates
        
        rover.move(command)
        expect(rover.coordinates).to eql(expected_position)
        expect(rover.direction).to eql(expected_direction)
      end 
    end

    it "should move correctly when pointing to the East direction" do
       [
        [[3,3], ["f"], [4,3], "E"],
        [[2,2], ["b"], [1,2], "E"],
        [[3,3], ["r"], [3,3], "S"],
        [[3,3], ["l"], [3,3], "N"]
      ].each do |coordinates, command, expected_position, expected_direction|
        rover.direction = "E"
        rover.coordinates = coordinates
        
        rover.move(command)
        expect(rover.coordinates).to eql(expected_position)
        expect(rover.direction).to eql(expected_direction)
      end 
    end

    it "should move correctly when pointing to the West direction" do
       [
        [[3,3], ["f"], [2,3], "W"],
        [[2,2], ["b"], [3,2], "W"],
        [[3,3], ["r"], [3,3], "N"],
        [[3,3], ["l"], [3,3], "S"]
      ].each do |coordinates, command, expected_position, expected_direction|
        rover.direction = "W"
        rover.coordinates = coordinates
        
        rover.move(command)
        expect(rover.coordinates).to eql(expected_position)
        expect(rover.direction).to eql(expected_direction)
      end 
    end
  end

  it "should recieve a character array of commands" do
    [
        [[0,0], "N", ["ffrff"], [2,2], "E"],
        [[1,1], "N", ["ffrff"], [3,3], "E"],
        [[3,4], "S", ["ffbrf"], [2,3], "W"]
    ].each do |coordinates, direction , command_array, expected_position, expected_direction|
      rover.direction = direction
      rover.coordinates = coordinates
      
      rover.move(command_array)

      expect(rover.coordinates).to eql(expected_position)
      expect(rover.direction).to eql(expected_direction)
    end 
  end

  it "should wrap around the grid correctly" do
    rover.boundary = [100,100]
    [
      [[0,0], "S", ["f"], [0,100]],
      [[0,0], "N", ["b"], [0,100]],
      [[4,100], "N", ["f"], [4,0]],
      [[4,100], "S", ["b"], [4,0]],
      
      [[0,0], "W", ["f"], [100,0]],
      [[0,0], "E", ["b"], [100,0]],
      [[100,4], "E", ["f"], [0,4]],
      [[100,4], "W", ["b"], [0,4]],

      [[1,0], "S", ["ffrff"], [100,99], "W"]

    ].each do |initial_coordinates, direction, command, expected_position|
        rover.coordinates = initial_coordinates
        rover.direction = direction
        rover.move(command)
        expect(rover.coordinates).to eql(expected_position)
    end
  end


  context "Obstacle detection" do
    before(:each) do
      rover.reset_rover_position
      rover.obstacle_handler.add_obstacle([1,1])
      rover.obstacle_handler.add_obstacle([1,2])
    end
    it "should stop at an obstacle" do
      rover.move(["frff"])
      expect(rover.coordinates).to eql([0,1])
    end
    it "should stop at an obstacle and proceed with further directions if stop_on_hitting_obstacle is false" do
      rover.stop_on_hitting_obstacle = false
      rover.move(["ffrflf"])
      expect(rover.coordinates).to eql([0,3])
      expect(rover.direction).to eql("N")
    end
    it "should stop at an obstacle and proceed with further directions" do
      rover.stop_on_hitting_obstacle = true
      rover.move(["ffrflf"])
      expect(rover.coordinates).to eql([0,2])
      expect(rover.direction).to eql("E")
    end
  end

end
