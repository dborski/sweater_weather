class RoadTripCreator
  attr_reader :origin, :destination

  def initialize(user_key, origin, destination)
    @user_key = user_key
    @origin = origin
    @destination = destination
  end
end 