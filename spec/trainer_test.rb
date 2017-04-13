require './spec_helper'

RSpec.describe Trainer do
  subject(:trainer) { Trainer.new(0,0)}
  it 'initializes with a position' do
    expect(subject.x_position).to eq(0)
    expect(subject.y_position).to eq(0)
  end
  context "Catching" do
    it "can catch nearby kudomon" do
      trainer = Trainer.new(0,0)
      kudomon = Kudomon.new("Sourbulb",0,1)
      trainer.catch(kudomon)
      expect(kudomon.check_owner(trainer)).to eq true
    end
    it "multiple trainers can catch the same kudomon" do
      player1 = Trainer.new(1,1)
      player2 = Trainer.new(1,3)
      slowtouch = Kudomon.new("Slowtouch",2,2)
      slowtouch.new_owner(player1)
      slowtouch.new_owner(player2)
      expect(slowtouch.check_owner(player1) && slowtouch.check_owner(player2)).to eq true
    end
  end
end
