class Artist
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def save
      @@all << self
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create(name)
    new_art = Artist.new(name)
    new_art.save
    new_art
  end
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end
  def genres
      songs.collect{|song| song.genre}.uniq
  end
end
