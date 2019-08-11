class Song
  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre
  def initialize(name, artist= nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  def self.new_from_filename(filename)
    parts = filename.split(" - ")

    artist = parts[0]
    song = parts[1]
    genre = parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save }
  end
end
