require './spec_helper'

RSpec.describe Kudomon do
  subject(:sourbulb) { Kudomon.new("Sourbulb", 0,0)}
  context "Initializing - " do
    it "Species should be Sourbulb" do
      expect(subject.species).to eq("Sourbulb")
    end
    it "Type should be grass" do
      expect(subject.type).to eq(:grass)
    end
    it "X Position should be 0" do
      expect(subject.x_position).to eq(0)
    end
    it "Y Position should be 0" do
      expect(subject.y_position).to eq(0)
    end
    it "Health should be 15" do
      expect(subject.health).to eq(15)
    end
    it "Attack should be 8" do
      expect(subject.attack).to eq(8)
    end
    it "Should not have an owner" do
      expect(subject.owner.empty?).to eq true
    end
  end

  context "Wrong Species" do
    it 'will cause an error' do
      expect { Kudomon.new("Wrong", 2,2) }.to raise_error "Species is not valid"
    end
  end

  context "Catching - " do
    it "it can be caught" do
      player = Trainer.new(1,1)
      geoman = Kudomon.new("Geoman",2,2)
      player.catch(geoman)
      expect(geoman.check_owner(player)).to eq true
    end
  end

  context "Battle -" do
    it "can attack another kudomon" do
      geoman = Kudomon.new("Geoman",1,2)
      slowtouch = Kudomon.new("Slowtouch",2,2)
      battle = Battle.new(geoman,slowtouch)
      battle.fight
      expect(geoman.health <= 0 || slowtouch.health <= 0).to eq true
    end
    it "attack becomes super effective" do
      geoman = Kudomon.new("Geoman",1,2)
      slowtouch = Kudomon.new("Slowtouch",2,2)
      expect(slowtouch.calculate_attack(geoman)).to eq(slowtouch.attack + 3)
    end
    it "can take damage" do
      geoman = Kudomon.new("Geoman",1,2)
      initial_health = geoman.health
      geoman.damage(5)
      expect(geoman.health).to eq(initial_health - 5)
    end
  end

end
