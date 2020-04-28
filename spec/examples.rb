require './lib/game'

describe Game do

  !let(:game) {Game.new}

  describe "#available" do

    it "returns available cells to play at start" do
      available = game.available.to_a
      expect(available).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it "returns available cells to play after 2nd move" do
      game.check(1)
      game.check(5)
      available = game.available
      expect(available).to eq([2, 3, 4, 6, 7, 8, 9])
    end

  end

  describe "#check" do

    it "returns 1st move validity by checking cell 1" do
      valid = game.check(1)
      expect(valid).to eq(true)
    end

    it "returns grid values after 1st move" do
      game.check(1)
      grid = game.get_grid
      expect(grid).to eq([1, 0, 0, 0, 0, 0, 0, 0, 0])
    end

    it "returns 2nd move validity by checking cell 2" do
      game.check(1)
      valid = game.check(2)
      expect(valid).to eq(true)
    end

    it "returns grid values after 2nd move" do
      game.check(1)
      valid = game.check(2)
      grid = game.get_grid
      expect(grid).to eq([1, 2, 0, 0, 0, 0, 0, 0, 0])
    end

    it "returns error_message existens" do
      expect(game.error_message.size.positive?).to eq(false)
    end

    it "returns 3rd move validity by checking cell 1 again" do
      game.check(1)
      game.check(2)
      valid = game.check(1)
      expect(valid).to eq(false)
    end

    it "returns error_message existens after 3rd move" do
      game.check(1)
      game.check(2)
      game.check(1)
      expect(game.error_message.size.positive?).to eq(true)
    end

  end

  describe "#get_grid" do

    it "returns grid values after 2nd move" do
      valid = game.check(1)
      valid = game.check(2)
      grid = game.get_grid
      expect(grid).to eq([1, 2, 0, 0, 0, 0, 0, 0, 0])
    end

  end

  describe "#delete_error" do

    it "returns error_message existens before deletion" do
      game.check(1)
      game.check(2)
      game.check(1)
      expect(game.error_message.size.positive?).to eq(true)
    end

    it "returns error_message existens after deletion" do
      game.check(1)
      game.check(2)
      game.check(1)
      game.delete_error
      expect(game.error_message.size.positive?).to eq(false)
    end

  end

end
