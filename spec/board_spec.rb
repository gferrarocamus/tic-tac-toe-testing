require './lib/board.rb'

RSpec.describe Board do
  b = Board.new
  slot1 = b.board[0]
  i = 1

  describe '#update_board' do
    it 'shows that the slot is initially 1' do
      expect(slot1).to eql(1)
    end
    it "changes the value of the slot to 'X'" do
      b.update_board(1, 'X')
      slot1 = b.board[0]
      expect(slot1).to eql('X')
    end
    it 'changes the value of the specified index to the string provided' do
      b.update_board(2, 'test')
      expect(b.board[i]).to eql('test')
    end
  end
end

RSpec.describe Board do
  describe '#slot_available' do
    b = Board.new
    it 'returns true for all slots after board creation' do
      results1 = []
      b.board.each do |slot|
        results1.push(b.slot_available(slot))
      end
      expect(results1.all?).to eql(true)
    end
    b2 = Board.new
    it 'returns false after a slot is updated' do
      b2.board[0] = 'test'
      results2 = []
      b.board.each do |slot|
        results2.push(b2.slot_available(slot))
      end
      expect(results2.all?).to eql(false)
    end
    it 'returns false for a individual slots taken' do
      c = Board.new
      c.board[0] = 'X'
      expect(c.slot_available(1)).to eql(false)
    end
  end
end
