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
    guest = @viewer.venue.return_guest_with_name(guest_name)
    item = @viewer.venue.bar.return_item_by_name(item_name)
    apply charge


  def load_test_data()
    params = @viewer.display_create_room()
    room = Room.new(params)
    @venue.add_room(room)
    @venue.bar.load_drinks('drinks.txt')
    @venue.bar.load_foods('foods.txt')
    @venue.rooms[0].load_songs('songs.txt')
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
        #do this
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