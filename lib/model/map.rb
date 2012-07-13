class Map
  attr_reader :width, :height, :score, :robot_x, :robot_y

  def initialize(input)
    @input = []
    input.each_line do |l|
      @input << l.chomp.split(//)
    end


    @width  = @input.max_by(&:length).size
    @height = @input.length
    @score  = 0
  end

  # Map item at the given coordinates
  # TODO: implement
  def get_at(x, y)
    @input[y][x]
  end

  # If the map, including Robot coordinates, is the same as given
  # TODO: implement
  def map_equals(other_map)
    false
  end

  # Returns a new instance of the map after the given step
  # TODO: implement
  def step(move)
    self
  end
end
