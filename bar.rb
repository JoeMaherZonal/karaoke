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

  def return_drink_by_name(name)
    @drinks.each{|drink| return drink if drink.name == name}
  end

  def return_drink_price_by_name(name)
    @drinks.each {|drink| return drink.price if drink.name == name}
  end

  def return_food_price_by_name(name)
    @foods.each {|food| return food.price if food.name == name}
  end

  def return_food_by_name(name)
    @foods.each{|food| return food if food.name == name}
  end

  def load_drinks(file_path)
    return if !(File.file?(file_path))
    return if File.zero?(file_path)
    loaded_drinks = File.open(file_path, "r")
    loaded_drinks.readlines.each do |line|
      temp_ary = line.split(":")
      drink_params = {}
      drink_params[temp_ary[0].to_sym] = temp_ary[1].to_s
      drink_params[temp_ary[2].to_sym] = temp_ary[3].to_s
      drink_params[temp_ary[4].to_sym] = temp_ary[5].to_i
      drink = Drink.new(drink_params)
      @drinks << drink
    end
  end

  def save_drinks(file_path)
    return if !(File.file?(file_path))
    drinks_file = File.open(file_path, 'w')
    @drinks.each do |drink|
      drink_as_string ="name:#{drink.name}:discription:#{drink.discription}:price:#{drink.price}:"
      drinks_file.puts(drink_as_string)
    end
    drinks_file.close
  end

end