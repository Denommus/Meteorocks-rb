class Vector
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +(v)
    Vector.new(@x + v.x, @y + v.y)
  end

  def -(v)
    Vector.new(@x - v.x, @y - v.y)
  end

  def *(v)
    if v.is_a?(Numeric)
      Vector.new(@x * v, @y * v)
    else
      @x * v.x + @y * v.y
    end
  end

  def rotate(radians)
    self.clone.rotate!(radians)
  end

  def rotate!(radians)
    sin = Math::sin(radians)
    cos = Math::cos(radians)
    x = @x * cos - @y * sin
    y = @x * sin + @y * cos
    @x, @y = x, y
    self
  end

  def length
    square_length ** 0.5
  end

  def square_length
    self * self
  end

  def normalize!
    x, y = @x/length, @y/length
    @x, @y = x, y
    self
  end

  def normalize
    self.clone.normalize!
  end

  def self.UNIT_Y
    @@UNIT_Y ||= Vector.new(0, 1)
  end

  def self.UNIT_X
    @@UNIT_X ||= Vector.new(1, 0)
  end

  def self.ZERO
    @@ZERO ||= Vector.new(0, 0)
  end
end
