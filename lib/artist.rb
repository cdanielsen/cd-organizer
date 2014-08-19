class Artist

	attr_reader :name

	def initialize attributes
		@name = attributes[:names]
	end

end