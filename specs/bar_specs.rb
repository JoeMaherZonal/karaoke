require('minitest/autorun')
require_relative('../bar')
require_relative('../drink')
require_relative('../food')


class TestDrink < MiniTest::Test
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
    @bar = Bar.new(foods, drinks)
    @woowoo = Drink.new({name: "Woo Woo", discription: "Cocktail of vodka, cranberry and peach shnapps", price: 9})
    @pizza = Food.new({name: "Pizza", discription: "Stone baked pizza with 3 topping choices", price: 11})
  end

  def test_add_drink()
    @bar.add_drink(@woowoo)
    assert_equal(3, @bar.drinks.length)
    assert_equal("Woo Woo", @bar.drinks[2].name)
  end

  def test_add_food()
    @bar.add_food(@pizza)
    assert_equal(3, @bar.foods.length)
    assert_equal("Pizza", @bar.foods[2].name)
  end

  def test_remove_food_by_name()
    @bar.remove_food("Burger")
    assert_equal(1, @bar.foods.length)
    assert_equal("Chicken Goujons", @bar.foods[0].name)
  end

  def test_remove_drink_by_name()
    @bar.remove_drink("Coke Cola")
    assert_equal(1, @bar.drinks.length)
    assert_equal("Fosters", @bar.drinks[0].name)
  end

  def test_return_drink_by_name()
    drink = @bar.return_drink_by_name("Coke Cola")
    assert_equal("Coke Cola", drink.name)
  end

  def test_return_drink_price_by_name()
    price = @bar.return_drink_price_by_name("Coke Cola")
    assert_equal(2.5, price)
  end

  def test_return_food_price_by_name()
    price = @bar.return_food_price_by_name("Burger")
    assert_equal(12, price)
  end

  def test_return_food_by_name()
    food = @bar.return_food_by_name("Chicken Goujons")
    assert_equal("Chicken Goujons", food.name)
  end
end