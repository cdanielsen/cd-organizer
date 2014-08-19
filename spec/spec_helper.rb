require 'rspec'
require 'cd'
require 'artist'

RSpec.configure do |config|
  config.before(:each) do
	Cd.class_variable_set :@@cd_lib, []
	Artist.class_variable_set :@@all_artists, []
  end
end
