class Guest
  attr_reader(:name, :tel, :email)
  def initialize(params)
    @name = params[:name]
    @tel = params[:tel]
    @email = params[:email]
    @money = params[:money]
    @fav_song = [:fav_song]
  end

end