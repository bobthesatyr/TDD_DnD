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

  it 'should be dead if damaged to 0 or less' do
    enemy = Character.new

    subject.attack(13, enemy)
    subject.attack(20, enemy)
    subject.attack(13, enemy)
    subject.attack(20, enemy)
    enemy.dead?.should eq(true)
  end

  it 'should be alive if damaged but still above 0' do
    enemy = Character.new

    subject.attack(13, enemy)
    subject.attack(20, enemy)
    enemy.dead?.should eq(false)
  end

  it 'should have default abilities' do
    subject.abilities[:str].should eq(10)
    subject.abilities[:dex].should eq(10)
    subject.abilities[:con].should eq(10)
    subject.abilities[:int].should eq(10)
    subject.abilities[:wis].should eq(10)
    subject.abilities[:cha].should eq(10)
  end

  it 'modifier should be determined by its ability score' do
    subject.get_modifier(1).should eq -5
    subject.get_modifier(2).should eq -4
    subject.get_modifier(3).should eq -4
    subject.get_modifier(4).should eq -3
    subject.get_modifier(5).should eq -3
    subject.get_modifier(6).should eq -2
    subject.get_modifier(7).should eq -2
    subject.get_modifier(8).should eq -1
    subject.get_modifier(9).should eq -1
    subject.get_modifier(10).should eq 0
    subject.get_modifier(11).should eq 0
    subject.get_modifier(12).should eq 1
    subject.get_modifier(13).should eq 1
    subject.get_modifier(14).should eq 2
    subject.get_modifier(15).should eq 2
    subject.get_modifier(16).should eq 3
    subject.get_modifier(17).should eq 3
    subject.get_modifier(18).should eq 4
    subject.get_modifier(19).should eq 4
    subject.get_modifier(20).should eq 5
  end

  it 'should add Strength modifier to hit and damage' do
    enemy = Character.new
    subject.abilities[:str] = 18

    subject.attack(6, enemy)
    enemy.hp.should eq(0)
  end

  it 'should double damage including Strength mod' do
    enemy = Character.new
    subject.abilities[:str] = 14

    subject.attack(20, enemy)
    enemy.hp.should eq(-1)
  end
end
