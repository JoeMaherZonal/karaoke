class Room
  attr_reader(:songs, :guests, :max_capacity, :fee)
  def initialize(params)
    @songs = params[:songs]
    @guests = params[:guests]
    @max_capacity = params[:max_capacity]
    @fee = params[:fee]
  end

  def add_song(song)
    return if song.nil? || song.class != Song
    @songs << song
  end

  def add_guest(guest)
    return if is_room_full?()
    return if guest.nil? || guest.class != Guest
    charge_guest_for_room(guest)
    @guests << guest
  end

  def remove_guest_by_name(name)
    @guests.each{|guest| @guests.delete(guest) if guest.name == name}
  end

  def is_room_full?()
    @guests.length >= @max_capacity
  end

  def charge_guest_for_room(guest)
    return if (!can_afford_room?(guest))
    guest.charge(@fee)
  end

  def add_purchase(guest, item)
    @guests.each {|guest| guest.purchases << item if guest == guest_to_charge}
  end

  def can_afford_room?(guest)
    guest.money >= @fee
  end

  def return_guest_by_name(name)
    @guests.each {|guest| return guest if guest.name == name}
  end

  def charge_guest(guest_to_charge, amount)
    @guests.each {|guest| guest.charge(amount) if guest == guest_to_charge}
  end

  def load_songs(file_path)
    return if !(File.file?(file_path))
    load_data  = File.open(file_path, "r")
      load_data.readlines.each do |line|
        temp_ary = line.split(":")
        song_params = {}
        song_params[temp_ary[0].to_sym] = temp_ary[1].to_s
        song_params[temp_ary[2].to_sym] = temp_ary[3].to_s
        song_params[temp_ary[4].to_sym] = temp_ary[5].to_s
        song_params[temp_ary[6].to_sym] = temp_ary[7].to_s
        song = Song.new(song_params)
        @songs << song
      end
    load_data.close
  end

  def save_songs(file_path)
    return if !(File.file?(file_path))
    songs_file = File.open(file_path, 'w')
    @songs.each do |song|
      songs_as_string ="title:#{song.title}:artist:#{song.artist}:genre:#{song.genre}:year:#{song.year}:"
      songs_file.puts(songs_as_string)
    end
    songs_file.close
  end

  def load_guests_from_list(file_path)
    return if !(File.file?(file_path))
    load_data  = File.open(file_path, "r")
      load_data.readlines.each do |line|
        temp_ary = line.split(":")
        guest_params = {}
        guest_params[temp_ary[0].to_sym] = temp_ary[1].to_s
        guest_params[temp_ary[2].to_sym] = temp_ary[3].to_s
        guest_params[temp_ary[4].to_sym] = temp_ary[5].to_s
        guest_params[temp_ary[6].to_sym] = temp_ary[7].to_i
        guest_params[temp_ary[8].to_sym] = temp_ary[9].to_s
        guest = Guest.new(guest_params)
        @guests << guest
      end
    load_data.close
  end

  def check_out_guests()
    @guests = [] if @guests.length > 0
  end

  def total_spend_of_all_guests()
    spend = 0
    @guests.each { |guest| spend += total_spend_of_guest(guest) }
    return spend
  end

  def total_spend_of_guest(guest)
    total = 0
    guest.purchases.each { |item| spend += item.price  }
    return total
  end

end
