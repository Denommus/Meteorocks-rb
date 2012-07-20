%w(vector circle).each { |s| require "./lib/math/#{s}.rb" }

class Player
  def initialize(window, x, y)
    @circle = Circle.new(Vector.new(x, y), 4)
    @vel = Vector.new(0, 0)
    @angle = 0
    @image = Gosu::Image.new(window, "content/sprites/shipSprite.bmp", false)
    @wnd = window
  end

  def update
    @angle -= 4.5 if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
    @angle += 4.5 if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
    @vel -= Vector.UNIT_Y.rotate(Math::PI*@angle/180) if button_down?(Gosu::KbUp) || button_down?(Gosu::GpButton0)
    move
  end

  def draw
    @image.draw_rot(@circle.position.x, @circle.position.y, 1, @angle)
  end

  private
  def move
    @circle.position += @vel
    @circle.position.x %= 800
    @circle.position.y %= 600

    @vel *= 0.95
  end

  def button_down?(button)
    @wnd.button_down?(button)
  end
end
