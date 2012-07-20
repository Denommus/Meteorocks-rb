class Circle
  attr_accessor :position, :radius

  def initialize(position, radius)
    @position, @radius = position, radius
  end

  def contains_point(point)
    (@position - point).square_length <= (@radius * @radius)
  end

  def intersects_circle(circle)
    (@position - circle.position).square_length <= ((@radius + circle.radius) * (@radius + circle.radius))
  end
end
