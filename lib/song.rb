class Song
  attr_accessor :name, :artist_name
  @@all = []

    def self.all
    @@all 
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
    song.save
    song
  end

  def Song.new_by_name(s_name)
    song = self.new
    song.name = s_name
    song
end

  def Song.create_by_name(s_name)
    song = self.create
    song.name = s_name
    song
  end

  def Song.find_by_name(s_name)
    self.all.detect{|song| song.name == s_name}
  end

  def Song.find_or_create_by_name(s_name)
    self.find_by_name(s_name) || self.create_by_name(s_name)
  end


   def Song.alphabetical 
    self.all.sort_by{|song| song.name}
   end

   def Song.new_from_filename(file_name)
    song = self.new
    split_file = file_name.split(" - ")
    song.artist_name = split_file[0] 
    song.name = split_file[1].gsub(".mp3","")
    song
  end

 def Song.create_from_filename(file_name)
  song = self.create
    split_file = file_name.split(" - ")
    song.artist_name = split_file[0] 
    song.name = split_file[1].gsub(".mp3","")
    song
   end 

  def Song.destroy_all
    @@all.clear

 end
end
