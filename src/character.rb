class Character
  attr_accessor :name, :alignment, :armor, :hp, :abilities

  def initialize(abilities = {str:10, dex:10, con:10, int:10, wis:10, cha:10})
    self.name = 'Bob'
    self.alignment = 'Neutral'
    self.abilities = abilities
    self.armor = 10 + get_modifier(abilities[:dex])
    self.hp = 5 + get_modifier(abilities[:con])
  end

  def attack(roll, target)
    deal_damage(target, roll) if hit?(roll, target.armor, abilities[:str])
  end

  def deal_damage(target, roll)
    roll == 20 ? multiplier = 2 : multiplier = 1
    damage = (1 + get_modifier(abilities[:str])) * multiplier
    damage = 1 if damage < 1
    target.hp = target.hp - damage
  end

  def hit?(roll, target_armor, strength)
    roll + get_modifier(strength) >= target_armor
  end

  def dead?
    hp <= 0
  end

  def get_modifier(score)
    ((score - 10)/2).floor
  end

end