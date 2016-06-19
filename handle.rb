require_relative('../food')
require_relative('../drink')
require_relative('../bar')
require_relative('../guest')
require_relative('../song')
require_relative('../room')
require_relative('../venue')
require_relative('../viewer')

class Handle
  def initialize(venue, viewer)
    @venue = viewer
    @viewer = viewer
  end

  def run()
    while true
    end
  end
end

run()