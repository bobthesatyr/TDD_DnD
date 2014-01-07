require 'rspec'
require_relative '../src/character'

describe Character do
  before (:each) do
    subject = Character.new
  end

  it 'should have a character that has a name' do
    subject.name.should eq('Bob')
  end

  it 'should be able to set the name' do
    subject.name = 'Adam'
    subject.name.should eq('Adam')
  end

  it 'should have an alignment' do
    subject.alignment.should eq('Neutral')
  end

  it 'should be able to set the alignment' do
    subject.alignment = 'Good'
    subject.alignment.should eq('Good')
  end

  it 'should have armor that defaults to 10' do
    subject.armor.should eq(10)
  end

  it 'should have hit points that start at 5' do
    subject.hp.should eq(5)
  end

  it 'should damage the attacker by 1 when I hit without crit' do
    enemy = Character.new

    subject.attack(13, enemy)
    enemy.hp.should eq(4)
  end

  it 'not deal damage on a miss' do
    enemy = Character.new

    subject.attack(1, enemy)
    enemy.hp.should eq(5)
  end

  it 'not deal damage on a miss' do
    enemy = Character.new

    subject.attack(20, enemy)
    enemy.hp.should eq(3)
  end

end
