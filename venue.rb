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
end