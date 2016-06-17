class Room
  attr_reader(:songs, :guests, :max_capacity)
  def initialize(songs = [], guests = [], max_capacity = 10)
    @songs = songs
    @guests = guests
    @max_capacity = max_capacity
  end

  def add_song(song)
    return if song.nil? || song.class != Song
    @songs << song
  end

  def add_guest(guest)
    return if guest.nil? || guest.class != Guest
    @guests << guest
  end

  def remove_guest_by_name(name)
    @guests.each{|guest| @guests.delete(guest) if guest.name == name}
  end

end