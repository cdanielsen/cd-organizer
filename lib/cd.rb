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
    @@cd_lib.sort! { |a, b| a.artist.downcase <=> b.artist.downcase }
  end

  def self.allby_artist artist
    albums = []
    self.all.each do |cd|
      if cd.artist.downcase == artist
        albums << cd
      end
    end
    albums
  end

  def self.unique_artists
    artist_names = []
    self.all.each do |cd|
      artist_names << cd.artist
    end
    artist_names.uniq.sort
  end

  def self.search_by_title title
    albums = []
    self.all.each do |cd|
      if cd.album.downcase == title
        albums << cd
      end
    end
    albums
  end
end