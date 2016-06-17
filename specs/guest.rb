require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup()
    @guests = Guest.new()
  end

  def test_add_new_guest()
    @guests.add_guest("Joe Maher", "123 Fake Street", "07539271620", "joseph-maher@hotmail.co.uk")
    assert_equal(1, @guests.guests.length )
  end
end