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



end
