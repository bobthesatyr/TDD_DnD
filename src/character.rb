class Character
  attr_accessor :name, :alignment, :armor, :hp

  def initialize
    self.name = 'Bob'
    self.alignment = 'Neutral'
    self.armor = 10
    self.hp = 5
  end

  def attack(roll, target)
    deal_damage(target, roll) if hit?(roll, target.armor)
  end

  def deal_damage(target, roll)
    target.hp = target.hp - (roll == 20 ? 2 : 1)
  end

  def hit?(roll, target_armor)
    roll > target_armor
  end
end