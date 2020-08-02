class Image
  attr_reader :id, :url

  def initialize(image_data)
    @url = image_data[:urls][:raw]
  end
end
