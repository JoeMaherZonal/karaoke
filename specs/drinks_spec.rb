require('minitest/autorun')
require_relative('../drink')

class TestDrink < MiniTest::Test
  def setup()
    fosters = {name: "Fosters", discription: "Pint", price: 4}
    @drink = Drink.new(fosters)
  end

  def test_return_price_of_drink()
    assert_equal(4, @drink.price)
  end
end