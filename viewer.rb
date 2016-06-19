class Viewer

  def get_song_details()
    system("clear")
    puts "What is the song title?"
    title = get_input()
    puts "Who is the artist?"
    artist = get_input()
    puts "What year was the song released?"
    year = get_input()
    song = create_song_hash(title, artist, year)
    return song
  end

  def get_input()
    print "> "
    return gets.chomp.downcase
  end

  def create_song_hash(title, artist, year)
    song = {}
    song[:title] = title
    song[:artist] = artist
    song[:year] = year
    return song
  end

  def main_menu_choice()
    while true
      system("clear")
      puts "The Karaoke Bar"
      puts ""
      puts "1-Display current rooms"
      puts "2-Check guest in/out"
      puts "3-Check entire room out"
      puts "4-Register new guest"
      puts "5-Charge guest"
      puts "6-Edit Karaoke bar"
      puts "7-Exit"
      puts ""
      puts "8-Load test data"
      puts ""
      print "> "
      choice = gets.chomp.to_i

      kill_program() if choice == 7
      return choice if (choice > 0 && choice < 9)
    end
  end

  def kill_program()
    system("clear")
    abort("Good Bye!")
  end

  def in_or_out()
    system("clear")
    puts "Would you like to check a guest in or out?[in/out]"
    print "> "
    choice = gets.chomp.downcase
    return choice if choice == "in" || choice == "out"
  end

  def display_create_room()
    system("clear")
    puts "<<Room Creator>>"
    puts ""
    puts "What is the maximum capacity of this room?"
    max_cap = get_input()
    puts "How much does this room cost per guest?"
    print "> £"
    price = gets.to_i
    room = {songs: [], guests: [], max_capacity: max_cap, fee: price}
    return room
  end
  def successful_load()
    puts ""
    puts "-Succesfuly loaded!"
    puts ""
    sleep(2)
  end

  def unsuccessful_load()
    puts ""
    puts "Unsuccessful load, check default load files have data."
    puts ""
    sleep(2)
  end


end

