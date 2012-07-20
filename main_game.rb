#!/usr/bin/env ruby

require 'gosu'
%w(player meteor).each { |s| require "./#{s}.rb" }

class GameWindow < Gosu::Window
  def initialize
    super 800, 600, false
    self.caption = "Meteorocks"
    @player = Player.new(self, 400, 300)
    @meteors = Array.new
    3.times do
      @meteors << Meteor.new(self)
    end
  end

  def update
    @player.update
    @meteors.each do |m|
      m.update
    end
  end

  def draw
    @player.draw
    @meteors.each do |m|
      m.draw
    end
  end
end

window = GameWindow.new
window.show
