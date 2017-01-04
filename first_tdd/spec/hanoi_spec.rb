require 'rspec'
require 'hanoi'

describe Hanoi do
  let(:game) { Hanoi.new }

  describe "#initialize" do
    it "initializes one tower and two empty towers" do
      expect(game.towers).to eq([[3, 2, 1], [], []])
    end
  end

  describe "#move" do
    it "moves a disc from one array to another" do
      expect(game.move(game.towers[0], game.towers[2])).to eq([[3, 2], [], [1]])
    end
  end

  describe "#valid_move?" do
    before do
      game.move(game.towers[0], game.towers[2])
    end

    it "returns false when the player asks to move disc on top of smaller disc" do
      expect(game.valid_move?(game.towers[0], game.towers[2])).to eq(false)
    end
  end

  # describe "#won?" do
  #
  #   before do
  #     game.move(game.towers[0], game.towers[2])
  #     game.move(game.towers[0], game.towers[1])
  #     game.move(game.towers[2], game.towers[1])
  #     game.move(game.towers[0], game.towers[2])
  #     game.move(game.towers[1], game.towers[2])
  #   end
  #
  #   it "wins when the all the discs are in the second or third tower" do
  #     expect(game.won?).to eq(true)
  #   end
  #
  # end

end
