class Artist

	attr_reader :name, :albums

	@@all_artists = []

	def initialize attributes
		@name = attributes[:name]
		@albums = []
	end

	def save
		@@all_artists << self
	end

	def self.all
		@@all_artists.sort! { |a, b| a.name.downcase <=> b.name.downcase }
	end

	def add_album album
		self.albums << album
	end
end 
