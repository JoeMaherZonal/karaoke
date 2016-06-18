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

  def return_room_index_of_guest(guest_name)
    @rooms.each do |room|
      room.guests.each do |guest|
       return room.guests.index(guest) if guest_name == guest.name
       end
    end
  end

  def charge_guest_for_drink(guest_name, drink_name)
    drink_price = @bar.return_drink_price_by_name(drink_name)
    room_index = return_room_index_of_guest(guest_name)
    guest_to_charge = @rooms[room_index].return_guest_by_name(guest_name)
    @rooms[room_index].charge_guest(guest_to_charge, drink_price)
  end

  def charge_guest_for_food(guest_name, food_name)
    food_price = @bar.return_food_price_by_name(food_name)
    room_index = return_room_index_of_guest(guest_name)
    guest_to_charge = @rooms[room_index].return_guest_by_name(guest_name)
    @rooms[room_index].charge_guest(guest_to_charge, food_price)
  end

end