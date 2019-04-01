require './lib/display_controller.rb'

RSpec.describe DisplayController do
  describe '#get_name' do
    before do
      allow($stdout).to receive(:write)
    end

    it 'returns a string' do
      allow(DisplayController).to receive(:gets).and_return('test')
      output = DisplayController.get_name(1)
      expect(output.class).to eql(String)
    end

    it "if no string is entered, returns 'Player' + the number passed " do
      allow(DisplayController).to receive(:gets).and_return('')
      player2 = DisplayController.get_name(2)
      expect(player2.empty?).to eql(false)
      expect(player2).to eql('Player 2')
    end

    it 'if a string is entered, returns the string in uppercase '\
        "(for example: 'namename' or 'NameName' => 'NAMENAME)" do
      allow(DisplayController).to receive(:gets).and_return('namename')
      name1 = DisplayController.get_name(1)
      expect(name1).to eql('NAMENAME')
      allow(DisplayController).to receive(:gets).and_return('NameName')
      name2 = DisplayController.get_name(1)
      expect(name2).to eql('NAMENAME')
    end
  end
end

RSpec.describe DisplayController do
  before do
    allow($stdout).to receive(:write)
  end

  describe '#get_move' do
    it 'returns a number from 1 to 9 as entered by the user' do
      allow(DisplayController).to receive(:gets).and_return("2\n")
      test1 = DisplayController.get_move("Player's Name")
      expect(test1).to eq(2)
    end
  end
end

RSpec.describe DisplayController do
  board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  describe '#show_board' do
    it 'prints a sample board' do
      expect { DisplayController.show_board(board) }.to output(
        "\n+- - - - - -+ \n| 1 | 2 | 3 | \n+- - - - - -+ \n"\
        "| 4 | 5 | 6 | \n+- - - - - -+ \n| 7 | 8 | 9 | \n+- - - - - -+ \n\n"
      ).to_stdout
    end
  end
end
