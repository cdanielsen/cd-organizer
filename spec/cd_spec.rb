require 'spec_helper'
require 'cd'

describe 'Cd' do

  describe 'intialize' do
    it 'is initialized with an album name' do
      test_cd = Cd.new({album: 'Hello Nasty'})
      expect(test_cd).to be_a Cd
    end
  end
  
  describe '#save' do
    it 'saves a new CD to the collection' do
      test_cd1 = Cd.new({album: 'Hello Nasty'})
      test_cd1.save
      expect(Cd.all).to eq [test_cd1]
    end
  end
    
  describe '.all' do
    it 'lists all Cds in the collection' do
      test_cd1 = Cd.new({album: 'Hello Nasty'})
      test_cd2 = Cd.new({album: 'Dig Your Own Hole'})
      test_cd1.save
      test_cd2.save
      expect(Cd.all).to eq [test_cd2, test_cd1]
    end
  end

  describe '.search_by_title' do
    it 'returns an alphabetized list of all CDs matching a given album title' do
      test_cd1 = Cd.new({album: 'Greatest Hits'})
      test_cd2 = Cd.new({album: 'Dookie'})
      test_cd3 = Cd.new({album: 'Ill Communication'})
      test_cd4 = Cd.new({album: 'Greatest Hits'})
      test_cd1.save
      test_cd2.save
      test_cd3.save
      test_cd4.save
      expect(Cd.search_by_title('Greatest Hits')).to eq [test_cd1, test_cd4]
    end
  end
end 
