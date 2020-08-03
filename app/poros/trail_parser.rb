class TrailParser
  def initialize
    @service = HikingService.new
  end

  def get_trails(lat, lng)
    trails = @service.get_trails(lat, lng)[:trails]
    new_trails_array = []
    trails.each do |trail|
      new_trails = {}
      new_trails[:name] = trail[:name]
      new_trails[:summary] = trail[:summary]
      new_trails[:difficulty] = trail[:difficulty]
      new_trails[:location] = trail[:location]
      new_trails_array << new_trails
    end
    new_trails_array
  end
end
