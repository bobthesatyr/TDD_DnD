describe Paladin do

  before (:each) do
    subject = Paladin.new
    @enemy = Character.new
  end

  it 'has 8 hp per level instead of 5' do
    subject.hp.should eq 8
    subject.gain_experience 1000
    subject.hp.should eq 16
  end

  it 'should have higher attack and damage vs evil' do
    @enemy.alignment = 'Evil'

    subject.attack(8, @enemy)
    subject.xp.should eq 10
    @enemy.hp.should eq 2
  end

  it 'triples the damage on crit for evil doers' do
    @enemy.alignment = 'Evil'
    subject.attack(20, @enemy)
    @enemy.hp.should eq -4
  end

  it 'increases the attack bonus for every level' do
    subject.gain_experience(3000)
    subject.attack_bonus.should eq(3)
  end

end
