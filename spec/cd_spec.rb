require 'rspec'
require 'cd'

describe 'Cd' do
  describe 'intialize' do
    it 'is initialized with an album name and an artist' do
      test_cd = Cd.new({album: 'Hello Nasty', artist: 'Beastie Boys'})
      expect(test_cd).to be_a Cd
    end
  end
end