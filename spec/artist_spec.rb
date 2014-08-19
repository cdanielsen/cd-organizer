require 'spec_helper'
require 'artist'

describe Artist do

	describe 'initialize' do
		it 'is initialized with an artist name' do
			test_artist = Artist.new({name: 'Beastie Boys'})
		end
	end
end