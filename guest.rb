class Guest
  attr_reader(:guests)
  def initialize(guests = [])
    @guests = guests
  end

  def add_guest(name, address, tel, email)
    new_guest = {}
    new_guest[:name] = name.to_s
    new_guest[:address] = address.to_s
    new_guest[:tel] = tel.to_s
    new_guest[:email] = email.to_s
    @guests << new_guest
  end

  def remove_guest_by_tel(tel_num)
    @guests.each { |guest| @guests.delete(guest) if guest[:tel] == tel_num}
  end

end