describe Monk do

  before (:each) do
    subject = Monk.new
    @enemy = Character.new
  end

  it 'has 6 hp per level instead of 5' do
    subject.hp.should eq 6
    subject.gain_experience 1000
    subject.hp.should eq 12
  end

  it 'does 3 points of damage instead of 10' do
    subject.attack(10, @enemy)
    @enemy.hp.should eq(2)
  end

  it 'should add Wisdom to armor in addition to Dex' do
    subject = Monk.new({str:10, dex:20, con:10, int:10, wis:20, cha:10})
    subject.armor.should eq 20
  end

  it 'should add Wisdom only if positive' do
    subject = Monk.new({str:10, dex:20, con:10, int:10, wis:1, cha:10})
    subject.armor.should eq 15
  end

  it 'should increase attack bonus every 2nd and 3rd level' do
    subject.gain_experience 4000
    subject.attack_bonus.should eq 3
  end

end