class Venue
  attr_reader(:rooms, :bar)
  def initialize(rooms = [], bar)
    @rooms = rooms
    @bar = bar
  end
end