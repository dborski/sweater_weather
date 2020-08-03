class HikingParser

  def initialize
    @service = HikingService.new
  end

  def get_trails(lat,lng)
    trails = @service.get_trails(lat,lng)

    
  end


end 