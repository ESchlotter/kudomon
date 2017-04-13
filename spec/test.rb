require './spec_helper'

player = Trainer.new(1,1)
geoman = Kudomon.new("Geoman",2,2)

player.catch(geoman)
