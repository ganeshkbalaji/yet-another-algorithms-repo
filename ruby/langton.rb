require 'pry'

SIZE = 50
class Ant
  attr_accessor :position, :direction

  def initialize
    @position = [SIZE / 2, SIZE / 2]
    @direction = 0
  end

  def update_position new_coords
    @position = [@position, new_coords].inject() do |ary, e|
      e.each_with_index do |ech, idx|
        ary[idx] += ech
      end
      ary
    end
  end

  DIRECTION = {
    0=> [0, 1],
    1=> [1, 0],
    2=> [0, -1],
    3=> [-1, 0]
  }

end

# binding.pry

@ant = Ant.new
@board = []
# ITERATIONS = 500

def move
  if is_part_of_board? @ant.position
    @ant.direction = (@ant.direction - 1) % 4
    @ant.update_position Ant::DIRECTION[@ant.direction]
  else
    @ant.direction = (@ant.direction + 1) % 4
    @ant.update_position Ant::DIRECTION[@ant.direction]
  end
  @and
end

def is_part_of_board? cell
  @board.include? cell
end

def flip_state cell
  if is_part_of_board? cell
    @board.delete cell
  else
    @board << cell.dup
  end
end

def main
  # ITERATIONS.times do |step|
  count = 0
  while(true) do
    p count += 1
    move
    draw
    # binding.pry
    flip_state @ant.position
    # binding.pry
    sleep(1.0/30.0)
  end
end

def draw
  board_to_draw = []
  SIZE.times do |h|
    SIZE.times do |w|
      if is_part_of_board? [w, h]
        board_to_draw << '█'
      else
        board_to_draw << ' '
      end
    end
    board_to_draw << '-'
  end
  board_to_draw.join.split('-').each {|i| p i.split(//).join(' ')}
end

main