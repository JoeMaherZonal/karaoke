require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup()
    new_guest = {name: "Joe Maher", tel: "07539271620", email: "joseph-maher@hotmail.co.uk" }
    @guest = Guest.new(new_guest)
  end

  def test_return_guest_name()
    assert_equal("Joe Maher", @guest.name)
  end
  

end