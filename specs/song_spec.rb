require('minitest/autorun')
require_relative('../song')

class TestSongs < MiniTest::Test
  def setup()
    song = {name: "My Way", artist: "Frank Sinatra", genre: "Jazz", year: 1969}
    @song = Song.new(song)
  end

  def test_check_song_genre()
    assert_equal("Jazz", @song.genre )
  end

end