require_relative './obstacle'

describe Obstacle do
    # Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.
    let(:obstacle){Obstacle.new}
    before(:each) do
      # add some obstacles
      obstacle.add_obstacle [1,1]
    end
    it "test presence of obstacles" do
      expect(obstacle.is_obstacle_present?([1,1])).to eql(true)
      expect(obstacle.is_obstacle_present?([2,1])).to eql(false)
    end

end