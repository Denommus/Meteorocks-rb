#!/usr/bin/env ruby

require 'gosu'
%w(player meteor).each { |s| require "./#{s}.rb" }

class GameWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Meteorocks"
    @objects = Array.new
    @objects << Player.new(self, 400, 300)
    3.times do
      @objects << Meteor.new(self)
    end
  end

  def update
    exit if !@objects.select { |m| m.is_a?(Meteor) && m.circle.intersects_circle(@objects[0].circle) }.empty?
    @objects.each do |m|
      m.update
    end
  end

  def draw
    @objects.each do |m|
      m.draw
    end
  end
end

window = GameWindow.new
window.show
