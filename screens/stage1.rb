class Stage1
  attr_accessor :objects

  def initialize(window)
    @wnd = window
    @objects = Array.new
    @objects << Player.new(@wnd, 400, 300)
    3.times do
      @objects << Meteor.new(@wnd)
    end
  end

  def update
    exit if !@objects.select { |o| o.is_a?(Meteor) && o.circle.intersects_circle(@objects[0].circle) }.empty?
    @objects.each do |o|
      o.update
    end
  end

  def draw
    @objects.each do |o|
      o.draw
    end
  end
end
