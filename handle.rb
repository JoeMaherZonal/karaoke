require_relative('food')
require_relative('drink')
require_relative('bar')
require_relative('guest')
require_relative('song')
require_relative('room')
require_relative('venue')
require_relative('viewer')

class Handle
  def initialize(venue, viewer)
    @venue = venue
    @viewer = viewer
  end

  def display_current_rooms()

  end

  def charge_guest()
    guest_name = @viewer.return_guest_name()
    item_name = @viewer.return_item_name(guest_name)
    guest = @venue.return_guest_with_name(guest_name)
    item = @venue.bar.return_item_by_name(item_name)

    return if !( is_valid_inputs?(guest, item, guest_name, item_name) )
  
    if @venue.guest_can_afford_item?(guest, item)
      @venue.charge_guest_for_food(guest.name, item.name) if item.class == Food
      @venue.charge_guest_for_drink(guest.name, item.name) if item.class == Drink
      @viewer.confirmation_of_purchase(guest.name, item.name, item.price)
    else
      @viewer.guest_cant_afford_item(guest.name, item.name,guest.money, item.price)
    end
  end

  def is_valid_inputs?(guest, item, guest_name, item_name)
    if guest.class != Guest
      @viewer.invalid_item_message(guest_name)
      is_valid = false
    elsif ( item.class != (Food || Drink) )
      @viewer.invalid_item_message(item_name)
      is_valid = false
    else
      is_valid = true
    end
    return is_valid
  end

  def register_new_guest()
    
  end


  def load_test_data()
    params = @viewer.display_create_room()
    room = Room.new(params)
    @venue.add_room(room)

    @venue.bar.load_drinks('drinks.txt')
     #@venue.bar.drinks.each{|drink| puts drink.name, " loaded!"}

    @venue.bar.load_foods('foods.txt')
     #@venue.bar.foods.each {|food| puts food.name, "loaded!"}

    @venue.rooms[0].load_songs('songs.txt')
     #@venue.rooms[0].songs.each {|song| puts song.title, "loaded!"}

    @venue.rooms[0].load_guests_from_list('guest_list.txt')
     #@venue.rooms[0].guests.each {|guest| puts guest.name, "loaded!"}

    if (@venue.bar.drinks.length > 0 && @venue.bar.foods.length > 0 && @venue.rooms[0].songs.length > 0)
      @viewer.successful_load()
    else
      @viewer.unsuccessful_load()
    end
  end

  def run()
    while true
      menu_selection = @viewer.main_menu_choice()
      case menu_selection
      when 1
        #do this
      when 2
        #do this
      when 3
        #do this
      when 4
        #do this
      when 5
        charge_guest()
      when 6
        #do this
      when 8
        load_test_data()
      end
    end
  end
end

bar = Bar.new()
venue = Venue.new([], bar)
viewer = Viewer.new()
handle = Handle.new(venue, viewer)
handle.run()