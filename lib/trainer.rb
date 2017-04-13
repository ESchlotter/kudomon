class Trainer
  attr_reader :x_position, :y_position, :kudomons
  def initialize (x_position,y_position)
    @x_position = x_position
    @y_position = y_position
    @kudomons = []
  end

  def catch(kudomon)
    x = @x_position - kudomon.x_position
    y = @y_position - kudomon.y_position
    if (x <= 5 &&  x >= -5 && y <= 5 &&  y >= -5) && kudomon.owner.empty?
      kudomons.push(kudomon)
      kudomon.new_owner(self)
    end
  end
end
