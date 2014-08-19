class Artist

	attr_reader :name

	@@all_artists = []

	def initialize attributes
		@name = attributes[:name]
	end

	def save
		@@all_artists << self
	end

	def self.all
		@@all_artists.sort! { |a, b| a.name.downcase <=> b.name.downcase }
	end
end
