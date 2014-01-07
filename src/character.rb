class Character
  attr_accessor :name, :alignment, :armor, :hp, :abilities

  def initialize
    self.name = 'Bob'
    self.alignment = 'Neutral'
    self.armor = 10
    self.hp = 5
    self.abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10}
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

  def dead?
    hp <= 0
  end

  def get_modifier(score)
    ((score - 10)/2).floor
  end


end