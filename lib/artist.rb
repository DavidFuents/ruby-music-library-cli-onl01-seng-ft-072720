class Artist 
    extend Concerns::Findable

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def save 
        @@all << self
    end     

    def songs 
        @songs 
    end
    
    def genres
       genre = self.songs.map {|song| song.genre}
       genre.uniq
    end
    
    def add_song(song)
        song.artist == nil ? song.artist = self : nil
        !@songs.include?(song) ? @songs << song : nil
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name) 
        artist = Artist.new(name)
        artist.save
        artist
    end
end