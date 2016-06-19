class Food
  attr_reader(:name, :discription, :price)
  def initialize(params)
    @name = params[:name]
    @discription = params[:discription]
    @price = params[:price]
  end
end