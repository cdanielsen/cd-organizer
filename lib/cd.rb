class Cd
  
  attr_reader :album
  @@cd_lib = []
  
  def initialize attributes
    @album = attributes[:album]
  end

  def save
    @@cd_lib << self
  end
  
  def self.all
    @@cd_lib.sort! { |a, b| a.album.downcase <=> b.album.downcase }
    @@cd_lib
  end

  def self.search_by_title title
    albums = []
    self.all.each do |cd|
      if cd.album.downcase == title.downcase
        albums << cd
      end
    end
    albums
  end
end
