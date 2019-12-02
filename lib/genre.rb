class Genre 

  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize (name)
    @name = name 
    @songs = []
    @@all << self 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
     Genre.all.clear 
  end
   
  def save 
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end
  
   def artists
    songs.collect{ |s| s.artist }.uniq
  end
end