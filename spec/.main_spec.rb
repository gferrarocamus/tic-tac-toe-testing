require './bin/main.rb'

RSpec.describe DisplayController do
  describe '#get_move' do
    it 'gets a number only from 1 to 9' do
      allow(DisplayController).to receive(:gets).and_return("19\n")
      test1 = DisplayController.get_move("Player's Name")
      expect(test1).to eq(0)
      expect { DisplayController.get_move("Player's Name") }.to output(
        "Wrong input, provide a number from 1 to 9. \n"\
        "Player's Name, select the spot you want to play on" \
            ' by entering the corresponding numb, from 1 to 9: '
      ).to_stdout
    end
  end
end
