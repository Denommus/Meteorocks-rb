%w(vector circle).each { |s| require "./lib/math/#{s}.rb" }

class Meteor
  attr_reader :circle
  def initialize(window)
    @wnd = window
    @circle = Circle.new(Vector.new(rand(800), rand(600)), 20)
    angle = rand(0...Math::PI*2)
    @vel = Vector.new(Math::cos(angle)*5, Math::sin(angle)*5)
    @image = Gosu::Image.new(window, "content/sprites/meteor.bmp", false)
    @angle = rand(0...Math::PI*2)
    @ang_vel = rand(0...Math::PI*2)
  end

  def update
    @circle.position += @vel
    @circle.position.x %= 800
    @circle.position.y %= 600
    @angle += @ang_vel
  end

  def draw
    @image.draw_rot(@circle.position.x, @circle.position.y, 1, @angle)
  end
end
