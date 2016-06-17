class Guest
  attr_reader(:name, :tel, :email, :money, :fav_song)
  def initialize(params)
    @name = params[:name]
    @tel = params[:tel]
    @email = params[:email]
    @money = params[:money]
    @fav_song = [:fav_song]
  end

 def charge(amount)
  @money -= amount
 end

end