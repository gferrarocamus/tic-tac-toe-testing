require './lib/board.rb'

RSpec.describe Board do
  b = Board.new
  slot1 = b.board[0]

  describe '#update_board' do
    it 'shows that the slot is initially 1' do
      expect(slot1).to eql(1)
    end
    it "changes the value of the slot to 'X'" do
      b.update_board(1, 'X')
      slot1 = b.board[0]
      expect(slot1).to eql('X')
    end
    it 'changes the value of index 1 to the exact string specified' do
      b.update_board(2, 'test')
      expect(b.board[1]).to eql('test')
    end
  end
end

RSpec.describe Board do
  describe '#slot_available' do
    b = Board.new

    it 'returns true if first slot is available' do
      expect(b.slot_available(1)).to eql(true)
    end
    c = Board.new
    c.board[0] = 'X'
    it 'returns false if the first slot is taken' do
      expect(c.slot_available(1)).to eql(false)
    end
  end
end
