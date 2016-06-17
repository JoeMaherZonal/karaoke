class Guest
  attr_reader(:name, :tel, :email)
  def initialize(params)
    @name = params[:name]
    @tel = params[:tel]
    @email = params[:email]
  end

end