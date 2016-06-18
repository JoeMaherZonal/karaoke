require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../venue')
require_relative('../bar')
require_relative('../food')
require_relative('../drink')



class TestVenue < MiniTest::Test

  def setup()
    burger = {name: "Burger", discription: "Beef Burger, served with chips or salad", price: 12}
    food1 = Food.new(burger)
    chicken = {name: "Chicken Goujons", discription: "Chicken Goujons served with sweet chilli dip", price: 5}
    food2 = Food.new(chicken)
    fosters = {name: "Fosters", discription: "Pint", price: 4}
    drink1 = Drink.new(fosters)
    cola = {name: "Coke Cola", discription: "330ml", price: 2.5}
    drink2 = Drink.new(cola)
    foods = [food1, food2]
    drinks = [drink1, drink2]
    bar = Bar.new(foods, drinks)
    @woowoo = Drink.new({name: "Woo Woo", discription: "Cocktail of vodka, cranberry and peach shnapps", price: 9})
    @pizza = Food.new({name: "Pizza", discription: "Stone baked pizza with 3 topping choices", price: 11})

    guest1 = Guest.new({name: "Joe Maher", tel: "07539271620", email: "joseph-maher@hotmail.co.uk", money: 100, fav_song: "My Way" })
    guest2 = Guest.new({name: "Rachel Barry", tel: "12345678910", email: "rachel_barry@gmail.com", money: 20, fav_song: "Born to Run" })
    @guest3 = Guest.new({name: "Charlie Maher", tel: "98765432101", email: "charlie_maher@hotmail.com", money: 50, fav_song: "Purple Rain"})
    song1 = Song.new({title: "My Way", artist: "Frank Sinatra", genre: "Jazz", year: 1969})
    song2 = Song.new({title: "Purple Rain", artist: "Prince", genre: "Pop", year: 1984})
    songs = [song1, song2]
    guests = [guest1, guest2]
    @room1 = Room.new(songs, guests, 5, 10)
    room2 = Room.new(songs, guests, 2, 10)
    @room3 = Room.new(songs, guests, 20, 10)
    rooms = [@room1, room2]

    @venue = Venue.new(rooms, bar)
  end


  def test_set_up()
    assert_equal("Coke Cola", @venue.bar.drinks[1].name)
    assert_equal("Joe Maher", @venue.rooms[0].guests[0].name)
    assert_equal("My Way", @venue.rooms[0].songs[0].title)
  end

  def test_add_new_room()
    @venue.add_room(@room3)
    assert_equal(3, @venue.rooms.length)
  end

  def test_remove_room()
    @venue.remove_room_by_index(1)
    assert_equal(1, @venue.rooms.length)
  end

  def test_return_room_index_of_guest
    room_index = @venue.return_room_index_of_guest("Joe Maher")
    assert_equal(0, room_index)
  end

  def test_charge_guest_for_drink()
    @venue.charge_guest_for_drink("Joe Maher", "Fosters")
    assert_equal(96, @venue.rooms[0].guests[0].money)
  end

  def test_charge_guest_for_food_by_names()
    @venue.charge_guest_for_food("Joe Maher", "Burger")
    assert_equal(88, @venue.rooms[0].guests[0].money)
  end

end