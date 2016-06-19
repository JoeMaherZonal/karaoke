class Guest
  attr_reader(:name, :tel, :email, :money, :fav_song, :purchases)
  def initialize(params)
    @name = params[:name]
    @tel = params[:tel]
    @email = params[:email]
    @money = params[:money]
    @fav_song = params[:fav_song]
    @purchases = []
  end

 def charge(amount)
  @money -= amount
 end

 def money()
  return @money
 end

 def purchase(item)
  @purchases << item
 end

end