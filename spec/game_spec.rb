require './lib/game.rb'

RSpec.describe Game do
  game = Game.new
  describe '#player_wins' do
    it 'returns true if player has the array of moves [1,2,3]' do
      expect(game.player_wins([1, 2, 3])).to eql(true)
    end
    it 'returns false if player has the array of moves [1,2,4]' do
      expect(game.player_wins([1, 2, 4])).to eql(false)
    end
    it 'returns true if player has an array of moves that includes [1,5,9]' do
      expect(game.player_wins([1, 2, 5, 9])).to eql(true)
    end
    it "returns false if player's array of moves is [1,2,4,8,9], "\
        'which has no winning combinations' do
      expect(game.player_wins([1, 2, 4, 8, 9])).to eql(false)
    end
    it 'returns true if player has the array of moves [1,2,3]' do
      expect(game.player_wins([1, 2, 3])).to eql(true)
    end
  end
end

RSpec.describe Game do
  arr = []

  describe '#create_players' do
    it 'adds two elements to the array' do
      arr = Game.create_players('X', 'Y')
      expect(arr.length).to be(2)
    end
    it 'creates Player objects' do
      arr = Game.create_players('X', 'Y')
      expect(arr[0].class).to eql(Player)
      expect(arr[1].class).to eql(Player)
    end
    it "uses the passed strings as the Player's names" do
      arr = Game.create_players('Name1', 'Name2')
      expect(arr[0].name).to eql('Name1')
      expect(arr[1].name).to eql('Name2')
    end
    it "passes the symbols 'X' and 'O' to the players" do
      arr = Game.create_players('Name1', 'Name2')
      expect(arr[0].token).to eql('X')
      expect(arr[1].token).to eql('O')
    end
  end
end
