require_relative "./mars_rover"

describe MarsRover do

  let(:rover){MarsRover.new}

  it "receives single commands and moves correctly" do
    [
      [[3, 3, "N"], ["f"], [3, 4, "N"]],
      [[3, 3, "N"], ["b"], [3, 2, "N"]],
      [[3, 3, "N"], ["r"], [3, 3, "E"]],
      [[3, 3, "N"], ["l"], [3, 3, "W"]],

      [[3, 3, "S"], ["f"], [3, 2, "S"]],
      [[3, 3, "S"], ["b"], [3, 4, "S"]],
      [[3, 3, "S"], ["r"], [3, 3, "W"]],
      [[3, 3, "S"], ["l"], [3, 3, "E"]],

      [[3, 3, "E"], ["f"], [4, 3, "E"]],
      [[2, 2, "E"], ["b"], [1, 2, "E"]],
      [[3, 3, "E"], ["r"], [3, 3, "S"]],
      [[3, 3, "E"], ["l"], [3, 3, "N"]],

      [[3, 3, "W"], ["f"], [2, 3, "W"]],
      [[2, 2, "W"], ["b"], [3, 2, "W"]],
      [[3, 3, "W"], ["r"], [3, 3, "N"]],
      [[3, 3, "W"], ["l"], [3, 3, "S"]]

    ].each do |current_position, command, expected_position|
      rover.rover_position.set_position(current_position[0], current_position[1], current_position[2])
      rover.move(command)
      expect(rover.rover_position.x_coordinate).to eql(expected_position[0])
      expect(rover.rover_position.y_coordinate).to eql(expected_position[1])
      expect(rover.rover_position.direction).to eql(expected_position[2])
    end
  end

  it "should recieve a character array of commands" do
    [
        [[0, 0, "N"], ["ffrff"], [2, 2, "E"]],
        [[1, 1, "N"], ["ffrff"], [3, 3, "E"]],
        [[3, 4, "S"], ["ffbrf"], [2, 3, "W"]]
    ].each do |current_position, command, expected_position|
      rover.rover_position.set_position(current_position[0], current_position[1], current_position[2])
      rover.move(command)
      expect(rover.rover_position.x_coordinate).to eql(expected_position[0])
      expect(rover.rover_position.y_coordinate).to eql(expected_position[1])
      expect(rover.rover_position.direction).to eql(expected_position[2])
    end
  end

  it "should wrap around the grid correctly" do
    rover.boundary = [100,100]
    [
      [[0,0, "S"], ["f"], [0, 100, "S"]],
      [[0,0, "N"], ["b"], [0, 100, "N"]],
      [[4, 100, "N"], ["f"], [4, 0, "N"]],
      [[4, 100, "S"], ["b"], [4, 0, "S"]],

      [[0, 0, "W"], ["f"], [100, 0, "W"]],
      [[0, 0, "E"], ["b"], [100, 0, "E"]],
      [[100, 4, "E"], ["f"], [0, 4, "E"]],
      [[100, 4, "W"], ["b"], [0, 4, "W"]],

      [[1, 0, "S"], ["ffrff"], [100, 99, "W"]]

    ].each do |current_position, command, expected_position|
      rover.rover_position.set_position(current_position[0], current_position[1], current_position[2])
      rover.move(command)
      expect(rover.rover_position.x_coordinate).to eql(expected_position[0])
      expect(rover.rover_position.y_coordinate).to eql(expected_position[1])
      expect(rover.rover_position.direction).to eql(expected_position[2])
    end
  end


  context "Obstacle detection" do
    before(:each) do
      rover.reset_rover_position
      rover.obstacle_handler.add_obstacle([1,1])
      rover.obstacle_handler.add_obstacle([1,2])
    end
    it "should stop at an obstacle" do
      rover.stop_on_hitting_obstacle = true
      rover.move(["frff"])
      expect(rover.rover_position.x_coordinate).to eql(0)
      expect(rover.rover_position.y_coordinate).to eql(1)
      expect(rover.rover_position.direction).to eql("E")
    end
    it "should stop at an obstacle and proceed with further directions if stop_on_hitting_obstacle is false" do
      rover.stop_on_hitting_obstacle = false
      rover.move(["ffrflf"])
      expect(rover.rover_position.x_coordinate).to eql(0)
      expect(rover.rover_position.y_coordinate).to eql(3)
      expect(rover.rover_position.direction).to eql("N")
    end
    it "should stop at an obstacle and proceed with further directions" do
      rover.stop_on_hitting_obstacle = true
      rover.move(["ffrflf"])
      expect(rover.rover_position.x_coordinate).to eql(0)
      expect(rover.rover_position.y_coordinate).to eql(2)
      expect(rover.rover_position.direction).to eql("E")
    end
  end

end
