require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(sname)
    song = self.new # creates a new song
    song.name = sname
    song
  end

  def self.create_by_name(sname)
    song = self.new
    song.name = sname
    song.save
    song
  end

  def self.find_by_name(sname)
    self.all.find{|song| song.name == sname}
  end

  def self.find_or_create_by_name(sname)
    self.find_by_name(sname) || self.create_by_name(sname)
  end

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(fname)
    file = self.new
    file.name = fname.split(/[-.]/)[1].strip
    file
  end

end
