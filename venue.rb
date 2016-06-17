class Venue
  attr_reader(:rooms, :bar)
  def initialize(rooms = [], bar)
    @rooms = rooms
    @bar = bar
  end

  def add_room(room)
    return if room.nil? || room.class != Room
    @rooms << room
  end

  def remove_room_by_index(index)
    @rooms.delete(@rooms[index])
  end

  def return_room_of_guest(guest_name)
    @rooms.each do |room|
      room.guests.each{|guest| return room if guest_name == guest.name}
    end
  end

  def charge_guest_for_drink(guest_name, drink_name)

  end


end