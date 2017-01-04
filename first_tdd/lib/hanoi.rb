class Hanoi

  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def gets_input
    puts "Enter a valid move"
    move = gets.chomp.split(",").map { |el| Integer(el) }

    until move.all? { |el| el.between?(0, 2) }
      move = gets.chomp.split(",").map { |el| Integer(el) }
    end

    move
  end

  def play

    until won?
      potential_move = gets_input
      start_tower = towers[potential_move[0]]
      end_tower = towers[potential_move[1]]

      if valid_move?(start_tower, end_tower)
        move(start_tower, end_tower)
      end
    end

    puts "You won!"

  end

  def valid_move?(start_tower, end_tower)
    if start_tower.empty?
      return false
    elsif end_tower.last < start_tower.last
      return false
    end
    true
  end

  def move(start_tower, end_tower)
    end_tower << start_tower.pop
    towers
  end

  def won?
    towers[1].length == 3 || towers[2].length == 3
  end

end
