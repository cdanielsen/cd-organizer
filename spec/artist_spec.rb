require 'spec_helper'
require 'artist'

describe Artist do

	describe 'initialize' do
		it 'is initialized with an artist name' do
			test_artist = Artist.new({name: 'Beastie Boys'})
		end
	end

	describe '#save' do
		it 'adds a new artist to the collection' do
			test_artist1 = Artist.new({name: 'Beastie Boys'})
			test_artist1.save
			expect(Artist.all).to eq [test_artist1]
		end
	end

	describe '.all' do
		it 'lists all artists in the collection' do
			test_artist1 = Artist.new({name: 'Beastie Boys'})
			test_artist2 = Artist.new({name: 'Green Day'})
			test_artist1.save
			test_artist2.save
			expect(Artist.all).to eq [test_artist1, test_artist2]
		end
	end

end
