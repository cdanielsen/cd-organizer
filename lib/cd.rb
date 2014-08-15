class Cd
  
  attr_reader :album, :artist
  @@cd_lib = []
  
  def initialize attributes
    @album = attributes[:album]
    @artist = attributes[:artist]
  end

  def save
    @@cd_lib << self
  end
  
  def self.all
    @@cd_lib
  end
  
end