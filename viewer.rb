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
    return gets.chomp
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
      print "> "
      choice = gets.chomp.to_i
      return choice if (choice > 0 && choice < 8)
    end
  end

  def in_or_out()
    system("clear")
    puts "Would you like to check a guest in or out?[in/out]"
    print "> "
    choice = gets.chomp.downcase
    return choice if choice == "in" || choice == "out"
  end

end

viewer = Viewer.new()
viewer.display_menu

