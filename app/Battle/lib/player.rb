class Player

attr_accessor :name
attr_accessor :hp
DEFAULT_HITPOINTS = 60

  def initialize(name)
    @name = name
    @hp = DEFAULT_HITPOINTS
  end

end
