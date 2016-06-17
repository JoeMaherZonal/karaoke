class Room
  attr_reader(:songs, :guests, :max_capacity, :fee)
  def initialize(songs = [], guests = [], max_capacity, fee)
    @songs = songs
    @guests = guests
    @max_capacity = max_capacity
    @fee = fee
  end

  def add_song(song)
    return if song.nil? || song.class != Song
    @songs << song
  end

  def add_guest(guest)
    return if is_room_full?()
    return if guest.nil? || guest.class != Guest
    charge_guest_for_room(guest)
    @guests << guest
  end

  def remove_guest_by_name(name)
    @guests.each{|guest| @guests.delete(guest) if guest.name == name}
  end

  def is_room_full?()
    @guests.length >= @max_capacity
  end

  def charge_guest_for_room(guest)
    return if (!can_afford_room?(guest))
    guest.charge(@fee)
  end

  def can_afford_room?(guest)
    guest.money >= @fee
  end

  def return_guest_by_name(name)
    @guests.each {|guest| return guest if guest.name == name}
  end

end
