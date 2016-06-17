require('minitest/autorun')
require_relative('../guest')

class TestGuest < MiniTest::Test
  def setup()
    @guests = Guest.new()
  end
end