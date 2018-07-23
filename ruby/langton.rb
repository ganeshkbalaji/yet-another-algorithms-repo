#!/usr/bin/env ruby

require 'drawille'
require "pp"

# Langton's Ant
# Draws in terminal

class Direction
    @dir = 0

    def initialize(direction)
        @dir = {up: 0, right: 1, down: 2, left: 3}[direction] || 0;
    end

    def transform_vector
        case @dir
        when 0
            return {x: 0, y: 1}
        when 1
            return {x: 1, y: 0}
        when 2
            return {x: 0, y: -1}
        when 3
            return {x: -1, y: 0}
        end
    end

    def turn_cw
        @dir = (@dir + 1) % 4
    end

    def turn_ccw
        @dir = (@dir + 3) % 4
    end
end

module State
    OFF = 0
    ON = 1
end

class Tile
    @state = State::OFF
    def initialize(state, character)
        @state = state
        @character = character
    end
    def state
        return @state
    end
    def flip
        if @state == State::OFF
            return @state = State::ON
        else
            return @state = State::OFF
        end
    end
    def bool
        return (@state == State::ON ? true : false)
    end
end

class Screen
    @screen = [];
    @x = 0
    @y = 0

    def initialize(x, y)
        @screen = Array.new(y) { Array.new(x) { Tile.new State::OFF,"." } }
        @x = x
        @y = y
    end

    def inspect
        string = "";
        @screen.each do |i|
            i.each do |j|
                string << (j.bool ? '██' : '  ')
            end
            string << ?\n
        end
        return string
    end

    def screen
        return @screen
    end

    def flip(x, y)
        return @screen[y][x].flip
    end

    def print
        @screen.each_with_index do |row, y|
            row.each_with_index do |cell, x|
                if cell.state == State::ON
                    puts PP.pp(@screen)
                else
                    puts PP.pp(@screen)
                end
            end
        end
    end

    def x
        @x
    end

    def y
        @y
    end
end

class Ant
    @x = 0
    @y = 0
    @direction = :up
    @screen = nil

    def initialize(x, y, direction, screen)
        @x, @y, @direction, @screen = x, y, direction, screen
    end

    def current_cell
        @screen.screen[@y][@x]
    end

    def step
        if current_cell.state == State::ON
            @direction.turn_cw
        else
            @direction.turn_ccw
        end
        @screen.flip(@x, @y)
        @x = (@x + @direction.transform_vector[:x]) % @screen.x
        @y = (@y + @direction.transform_vector[:y]) % @screen.y
    end
end

def main
    screen = Screen.new(3, 4);
    ant = Ant.new(0, 0, Direction.new(:down), screen);

    7.times do
      screen.print
      ant.step
    end
end

main