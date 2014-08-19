require 'spec_helper'

describe Artist do

	describe 'initialize' do
		it 'is initialized with an artist name and an empty albums array' do
			test_artist = Artist.new({name: 'Beastie Boys'})
			expect(test_artist).to be_a Artist
			expect(test_artist.name).to eq 'Beastie Boys'
			expect(test_artist.albums).to eq []
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

	describe '#add_album' do
		it 'links an album to an artist' do
			test_artist1 = Artist.new({name: 'Beastie Boys'})
			test_cd1 = Cd.new({album: 'Hello Nasty'})
			test_artist1.save
			test_cd1.save
			test_artist1.add_album(test_cd1)
			expect(test_artist1.view_albums).to eq [test_cd1]
		end
	end

	describe '#view_albums' do
		it 'shows all albums linked to an artist' do
			test_artist1 = Artist.new({name: 'Beastie Boys'})
			test_cd1 = Cd.new({album: 'Hello Nasty'})
			test_cd2 = Cd.new({album: 'Ill Communication'})
			test_artist1.save
			test_cd1.save
			test_cd2.save
			test_artist1.add_album(test_cd1)
			test_artist1.add_album(test_cd2)
			expect(test_artist1.view_albums).to eq [test_cd1, test_cd2]
		end
	end

end
