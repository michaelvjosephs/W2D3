require 'rspec'
require 'array'
require 'byebug'

describe Array do
  let(:ar1) { [-1, 0, 2, -2, 1] }
  let(:ar2) { [1, 2, 1, 3, 3] }
  let(:ar3) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  let (:ar4) { [40, 20, 10, 35] }
  let (:ar5) { [40, 20, 10, 0] }

  describe "#my_uniq" do
    it "only returns unique values" do
      expect(ar2.my_uniq).to eq([1, 2, 3])
      expect(ar1.my_uniq).to eq([-1, 0, 2, -2, 1])
    end

    it "doesn't use ruby's #uniq method" do
      expect(ar2).to_not receive(:uniq)
      ar2.my_uniq
    end
  end

  describe "#two_sum" do
    it "has all entries sum to zero" do
      expect(ar1.two_sum).to eq([[0, 4], [2, 3]])
      expect(ar2.two_sum).to eq([])
    end

    it "doesn't contain duplicate entries" do
      expect(ar1.two_sum).not_to include([4, 0], [3, 2])
    end

    it "doesnt have pairs of the same index" do
      expect(ar1.two_sum).not_to include([1, 1])
    end
  end

  describe "#my_transpose" do
    it "has the same row and col length as original matrix" do
      expect(ar3.first.length).to eq(ar3.my_transpose.first.length)
    end

    it "transposes the array" do
      expect(ar3.my_transpose).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]])
    end

    it "doesn't use the #transpose method" do
      expect(ar3).to_not receive(:transpose)
      ar3.my_transpose
    end
  end

  describe "#stock_picker" do
    it "returns the most profitable pair of days to buy and sell" do
      expect(ar4.stock_picker).to eq([2,3])
    end

    it "buys before it sells" do
      expect(ar4.stock_picker[0]).to be < ar4.stock_picker[1]
    end

    it "returns nil if there is no profitable option" do
      expect(ar5.stock_picker).to eq(nil)
    end
  end


end
