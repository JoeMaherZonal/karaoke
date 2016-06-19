class Song
  attr_reader(:title, :artist, :genre, :year)
  def initialize(params)
    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end
end
