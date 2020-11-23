class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    newsong = Song.new
    newsong.save
    return newsong
  end

  def self.new_by_name(name)
    selfsong = self.new
    selfsong.name = name
    return selfsong
  end

  def self.create_by_name(name)
    createsong = self.create
    createsong.name = name
    return createsong
  end

  def self.find_by_name(name)
    return self.all.find do |findsong|
      findsong.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|songs| songs.name}
  end

  def self.new_from_filename(file)
    arra = file.split(/[-.]/)
    filesong = self.new_by_name(arra[1].strip)
    filesong.artist_name = arra[0].strip
    filesong
  end

  def self.create_from_filename(file)
    arra = file.split(/[-.]/)
    createfilesong = self.create_by_name(arra[1].strip)
    createfilesong.artist_name = arra[0].strip
    createfilesong
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
