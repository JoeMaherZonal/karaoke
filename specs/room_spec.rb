require('minitest/autorun')
require_relative('../room')
require_relative('../guest')
require_relative('../song')


class TestRoom < MiniTest::Test
  def setup()
    guest1 = Guest.new({name: "Joe Maher", tel: "07539271620", email: "joseph-maher@hotmail.co.uk", money: 100, fav_song: "My Way" })
    guest2 = Guest.new({name: "Rachel Barry", tel: "12345678910", email: "rachel_barry@gmail.com", money: 20, fav_song: "Born to Run" })
    song1 = Song.new({title: "My Way", artist: "Frank Sinatra", genre: "Jazz", year: 1969})
    song2 = Song.new({title: "Purple Rain", artist: "Prince", genre: "Pop", year: 1984})
    songs = [song1, song2]
    guests = [guest1, guest2]
    room_params1 = {songs: songs, guests: guests, max_capacity: 5, fee: 5}
    room_params2 = {songs: songs, guests: guests, max_capacity: 2, fee: 10}
    room_params3 = {songs: [], guests: [], max_capacity: 10, fee: 10}
    @room1 = Room.new(room_params1)
    @room2 = Room.new(room_params2)
    @room3 = Room.new(room_params3)
    @guest3 = Guest.new({name: "Charlie Maher", tel: "98765432101", email: "charlie_maher@hotmail.com", money: 50, fav_song: "Purple Rain"})
  end

  def test_set_up()
    assert_equal(2, @room1.songs.length)
    assert_equal(2, @room1.guests.length)
  end

  def test_add_song()
    song3 = Song.new({name: "Born to Run", artist: "Bruce Springsteen", genre: "Rock", year: 1975})
    @room1.add_song(song3)
    assert_equal(3, @room1.songs.length)
  end

  def test_add_guest()
    @room1.add_guest(@guest3)
    assert_equal(3, @room1.guests.length)
  end

  def test_cant_add_wrong_object_to_song()
    song3 = @guest3
    @room1.add_song(song3)
    assert_equal(2, @room1.songs.length)
  end

  def test_cant_add_wrong_object_to_guest()
   guest3 = Song.new({name: "Born to Run", artist: "Bruce Springsteen", genre: "Rock", year: 1975})
   @room1.add_guest(guest3)
   assert_equal(2, @room1.guests.length) 
  end

  def test_remove_guest_by_name()
    @room1.remove_guest_by_name("Joe Maher")
    assert_equal(1, @room1.guests.length)
    assert_equal("Rachel Barry", @room1.guests[0].name)
  end

  def test_is_room_full?()
    assert_equal(true, @room2.is_room_full?())
    assert_equal(false, @room1.is_room_full?())
  end

  def test_guest_can_afford_room?()
    assert_equal(true, @room1.can_afford_room?(@guest3))
  end

  def test_charge_guest_for_room()
    @room1.charge_guest_for_room(@guest3)
    assert_equal(45, @guest3.money)
  end

  def test_return_guest_by_name()
    guest = @room1.return_guest_by_name("Joe Maher")
    assert_equal("Joe Maher", guest.name)
  end

  def test_load_songs_from_textfile()
    @room3.load_songs("songs.txt")
    assert_equal(Song, @room3.songs[0].class)
    assert_equal(2, @room3.songs.length)
  end

  def test_save_songs_to_textfile()
    @room2.save_songs("songs.txt")
    first_line = File.open("songs.txt").readline
    expected_line = "title:My Way:artist:Frank Sinatra:genre:Jazz:year:1969:\n"
    assert_equal(expected_line, first_line)
  end
end