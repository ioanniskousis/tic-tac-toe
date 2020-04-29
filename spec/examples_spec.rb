require 'game'

describe Game do
  let(:game) { Game.new }

  describe '#available' do
    it 'returns available cells to play at start' do
      expect(game.available).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end

    it 'returns available cells to play after 2nd move' do
      game.check(1)
      game.check(5)
      expect(game.available).to eq([2, 3, 4, 6, 7, 8, 9])
    end
  end

  describe '#check' do
    it 'returns 1st move validity by checking cell 1' do
      expect(game.check(1)).to eq(true)
    end

    it 'returns 2nd move validity by checking cell 2' do
      game.check(1)
      valid = game.check(5)
      expect(valid).to eq(true)
    end

    it 'returns error_message existens at start' do
      expect(game.error_message.size.positive?).to eq(false)
    end

    it 'returns 3rd move validity by checking cell 1 again' do
      game.check(1)
      game.check(2)
      valid = game.check(1)
      expect(valid).to eq(false)
    end

    it 'returns error_message existens after 3rd move being invalid' do
      game.check(1)
      game.check(2)
      game.check(1)
      expect(game.error_message.size.positive?).to eq(true)
    end
  end

  describe '#grid' do
    it 'returns grid values after 1st move' do
      game.check(1)
      expect(game.grid).to eq([1, 0, 0, 0, 0, 0, 0, 0, 0])
    end

    it 'returns grid values after 2nd move' do
      game.check(1)
      game.check(2)
      expect(game.grid).to eq([1, 2, 0, 0, 0, 0, 0, 0, 0])
    end

    it 'returns grid values after 4th move' do
      game.check(1)
      game.check(2)
      game.check(9)
      game.check(5)
      expect(game.grid).to eq([1, 2, 0, 0, 2, 0, 0, 0, 1])
    end
  end

  describe '#delete_error' do
    it 'returns error_message existens before deletion' do
      game.check(1)
      game.check(2)
      game.check(1)
      expect(game.error_message.size.positive?).to eq(true)
    end

    it 'returns error_message existens after deletion' do
      game.check(1)
      game.check(2)
      game.check(1)
      game.delete_error
      expect(game.error_message.size.positive?).to eq(false)
    end
  end

  describe '#winner' do
    it 'returns 0 since there is no winner yet after the third move' do
      game.check(1)
      game.check(2)
      game.check(4)
      expect(game.winner).to eq(0)
    end

    it 'returns 0 since there is no winner yet after the sixth move' do
      game.check(1)
      game.check(2)
      game.check(3)
      game.check(4)
      game.check(5)
      game.check(6)
      expect(game.winner).to eq(0)
    end

    it 'returns 1 since player1 is the winner after the seventh move' do
      game.check(1)
      game.check(2)
      game.check(3)
      game.check(4)
      game.check(5)
      game.check(6)
      game.check(7)
      expect(game.winner).to eq(1)
    end

    it 'returns 2 since player2 is the winner after the sixth move' do
      game.check(2)
      game.check(7)
      game.check(1)
      game.check(5)
      game.check(9)
      game.check(3)
      expect(game.winner).to eq(2)
    end
  end
end
