require 'rspec'
require 'cd'

describe 'Cd' do

  before do
     Cd.class_variable_set :@@cd_lib, []
  end

  describe 'intialize' do
    it 'is initialized with an album name and an artist' do
      test_cd = Cd.new({album: 'Hello Nasty', artist: 'Beastie Boys'})
      expect(test_cd).to be_a Cd
    end
  end
  
  describe '#save' do
    it 'adds a new CD to an array' do
      test_cd1 = Cd.new({album: 'Hello Nasty', artist: 'Beastie Boys'})
      test_cd1.save
      expect(Cd.all).to eq [test_cd1]
    end
  end
    
  describe '.all' do
    it 'lists all Cds in the collection' do
      test_cd1 = Cd.new({album: 'Hello Nasty', artist: 'Beastie Boys'})
      test_cd2 = Cd.new({album: 'Dig Your Own Hole', artist: 'Chemical Brothers'})
      test_cd1.save
      test_cd2.save
      expect(Cd.all).to eq [test_cd1, test_cd2]
    end
  end
end