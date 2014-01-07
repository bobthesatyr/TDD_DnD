class Character
  attr_accessor :name, :alignment, :armor, :hp

  def initialize
    self.name = 'Bob'
    self.alignment = 'Neutral'
    self.armor = 10
    self.hp = 5
  end

  def attack(roll, target)
     roll > target.armor ? 'hit' : ''
  end
end