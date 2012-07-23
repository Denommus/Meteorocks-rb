%w(vector circle).each { |s| require "./lib/math/#{s}.rb" }

class Shoot
  attr_reader :circle

  def initialize(window, angle, position)
    @wnd = window
    @wnd.screen.objects << self
    @angle = angle
    @circle = Circle.new(position, 10)
    @time_left = 0.5
  end

  def update
    @circle.position -= Vector.UNIT_Y.rotate(Math::PI*@angle/180)*10
    @circle.position.x %= 800
    @circle.position.y %= 600
    @time_left -= 1.0/60
    @wnd.screen.objects.select! { |o| !(o.is_a?(Meteor) && o.circle.intersects_circle(@circle)) }
    @wnd.screen.objects.select! { |o| o != self } if @time_left <= 0
  end

  def draw
    @wnd.draw_circle(@circle.position.x, @circle.position.y, @circle.radius, Gosu::Color::WHITE)
  end
end
