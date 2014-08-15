class Cd
  
  attr_reader :album, :artist
  
  def initialize attributes
    @album = attributes[:album]
    @artist = attributes[:artist]
  end
end