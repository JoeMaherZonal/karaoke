class Viewer

  def get_song_details()
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

end

