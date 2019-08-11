class Genre
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
    new_gen = Genre.new(name)
    new_gen.save
    new_gen
  end
  def add_song(song)

    @songs << song unless songs.include?(song)
  end
  def artists
    songs.collect{|song| song.artist}.uniq

  end
end
