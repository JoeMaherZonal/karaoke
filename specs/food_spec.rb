require('minitest/autorun')
require_relative('../food')

class TestDrink < MiniTest::Test
  def setup()
    burger = {name: "Burger", discription: "Beef Burger, served with chips or salad", price: 12}
    @food = Food.new(burger)
  end

  def test_return_food_price()
    assert_equal(12, @food.price)
  end
end