class MusicImporter
  attr_accessor :filenames
  attr_reader :path
  def initialize(path)
    @path = path

  end
  def files
      @filenames ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end
