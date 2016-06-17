require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup()
    @guests = Guest.new()
    @guests.add_guest("Rachel Barry", "123 Fake Street", "12345678910", "rachel_barry@gmail.com")
    @guests.add_guest("Charlie Maher", "125 Cumberland Road", "07826173920", "charlie@cm.com")
  end

  def test_add_new_guest()
    @guests.add_guest("Joe Maher", "123 Fake Street", "07539271620", "joseph-maher@hotmail.co.uk")
    assert_equal(3, @guests.guests.length )
  end

  def remove_guest_by_tel_num()
    @guests.remove_guest_by_tel("12345678910")
    assert_equal(1, @guests.guests.length )
  end

end