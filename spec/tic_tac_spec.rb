require 'rspec'
require 'game'
require 'spaces'
# require 'ui'

describe 'Game' do
  it 'creates an instance of the game class' do
    test_game = Game.new
    expect(test_game).to be_an_instance_of Game
  end
  it 'creates 9 spaces for the game board' do
    test_game = Game.new
    expect(test_game.space.length).to eq 9
  end
  it 'recognizes win condition for horizontal and vertical conditions' do
    test_game = Game.new
    test_game.space = ['O','O','O',4,5,6,7,8,9]
    expect(test_game.check).to eq true
  end
  it 'recognizes win condition for diagonal conditions' do
    test_game = Game.new
    test_game.space = [1,2,'X',4,'X',6,'X',8,9]
    expect(test_game.check).to eq true
  end
  it 'recognizes win condition for diagonal conditions' do
    test_game = Game.new
    test_game.space = [1,2,'X',4,'X',6,'X',8,9]
    expect(test_game.set_space(4,'O')).to eq [1,2,'X','O','X',6,'X',8,9]
  end
end
