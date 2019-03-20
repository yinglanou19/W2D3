def my_uniq(arr)
  raise ArgumentError if (arr.nil? || !arr.is_a?(Array))
  hash = Hash.new(0)
  res = []
  arr.each do |el|
    if !hash.has_key?(el)
      res << el
      hash[el] += 1
    end
  end
  res
end

class Array
  def two_sum
    arr = []
    (0...self.length).each do |i|
      (i + 1...self.length).each do |j|
        arr << [i, j] if self[i] + self[j] == 0
      end
    end
    arr
  end
end

def my_transpose(matrix)
  raise ArgumentError if matrix.length != matrix[0].length
  new_matrix = Array.new(matrix.length) { Array.new(matrix.length) }
  (0...matrix.length).each do |i|
    (0...matrix[0].length).each do |j|
      new_matrix[i][j] = matrix[j][i]
    end
  end
  new_matrix
end

def stock_picker(array)
  res = []
  max_profit = 0
  (0...array.length).each do |i|
    (i + 1...array.length).each do |j|
      curr_profit = array[j] - array[i]
      if curr_profit > max_profit
        max_profit = curr_profit
        res = [i, j]
      end
    end
  end
  res
end

class Hanoi
  attr_reader :hash, :num_of_disks

  def initialize(num_of_disks)
    # stacks
    @num_of_disks = num_of_disks
    @hash = {"1" => (1..num_of_disks).to_a.reverse, "2" => [], "3" => []}
  end

  def move(from_pile, to_pile)
    if valid_move?(from_pile, to_pile)
      to_pile.push(from_pile.pop)
    end
    return nil
  end

  def valid_move?(from_pile, to_pile)
    return false if from_pile.empty?
    return true if to_pile.empty?
    return false if from_pile.last > to_pile.last
    return true
  end

  def won?
    return true if hash["3"].length == num_of_disks
    return false
  end

  def print_piles
    puts "Left: "
    hash["1"].each { |el| print el }
    puts "\n-----"
    puts "Middle: "
    hash["2"].each { |el| print el }
    puts "\n-----"
    puts "Right: "
    hash["3"].each { |el| print el }
    puts "\n-----"
  end

  def play
    game_finish = false
    puts "Move everything to the right pile to win!!!"
    while !game_finish
      print_piles
      from_pile = prompt_for_pile
      to_pile = prompt_for_pile
      move(from_pile, to_pile)
      game_finish = won?
    end
    puts "YOU WON!!!!!"
  end

  def prompt_for_pile
    puts "Enter 1, 2 or 3 for pile: "
    pile_idx = gets.chomp
    return hash[pile_idx]
  end
end
