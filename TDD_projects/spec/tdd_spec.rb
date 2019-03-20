require "rspec"
require "tdd"

describe "#my_uniq" do
  it "returns an array with no duplicates" do
    expect(my_uniq([1, 1, 2, 3])).to eq([1, 2, 3])
  end

  it "raise error when no argument is passed" do
    expect { my_uniq() }.to raise_error(ArgumentError)
  end
  it "raise error when non-array argument is passed" do
    expect { my_uniq("something") }.to raise_error(ArgumentError)
  end
end

describe "#two_sum" do
  subject(:array) { [-1, 0, 2, -2, 1] }
  it "returns all pairs of indices" do
    expect(array.two_sum).to include([2, 3], [0, 4])
  end

  it "should return indices in correct order" do
    expect(array.two_sum).to eq([[0, 4], [2, 3]])
  end
end

describe "#my_transpose" do
  subject(:matrix) {
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
    ]
  }
  it "raise error when matrix is not square" do
    expect { my_transpose([[1, 2, 3], [4, 5, 6]]) }.to raise_error(ArgumentError)
  end
  it "transform each rows to column" do
    expect(my_transpose(matrix)).to eq([[0, 3, 6],
                                        [1, 4, 7],
                                        [2, 5, 8]])
  end
end

describe "#stock_picker" do
  let(:array) { [100, 2, 5, 9, 1, 4] }
  let(:loss) { [7, 6, 5, 4, 3, 2, 1] }

  it "should return an empty array if no profitable pair" do
    expect(stock_picker(loss)).to be_empty
  end

  it "should not sell befor you buy" do
    expect(stock_picker(array).sort).to eq([1, 3])
  end
end

RSpec.describe Hanoi do
  subject(:game) { Hanoi.new(5) }
  describe "#initialize" do
    it "set up the number of disk" do
      expect(game.num_of_disks).to eq(5)
    end
    it "should set up left stack correctly" do
      expect(game.hash["1"]).to eq([5, 4, 3, 2, 1])
    end
    it "should set middle stack correctly" do
      expect(game.hash["2"]).to be_empty
    end
    it "should set middle stack correctly" do
      expect(game.hash["3"]).to be_empty
    end
  end
  describe "#move" do
    let(:left) { [3, 2, 1] }
    let(:right) { [5, 4] }
    it "should call valid_move" do
      expect(game).to receive(:valid_move?)
      game.move(left, right)
    end
  end

  describe "#won?" do
    it "should return true when all disks are in right pile" do
      game.hash["3"] = [5, 4, 3, 2, 1]
      expect(game.won?).to eq(true)
    end
    it "should return false when game is not done" do
      expect(game.won?).to eq(false)
    end
  end
end
