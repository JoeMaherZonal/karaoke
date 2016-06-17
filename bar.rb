class Bar
  attr_reader(:foods, :drinks)
  def initialize(foods = [], drinks = [])
    @foods = foods
    @drinks = drinks
  end

  def add_drink(drink)
    return if drink.nil? || drink.class != Drink
    @drinks << drink
  end

  def add_food(food)
    return if food.nil? || food.class != Food
    @foods << food
  end

  def remove_drink(drink_name)
    @drinks.each{|drink| @drinks.delete(drink) if drink.name == drink_name}
  end

  def remove_food(food_name)
    @foods.each{|food| @foods.delete(food) if food.name == food_name}
  end
end