class Api::V1::BackgroundsController < Api::V1::BaseController
  def index
    unsplash_photo = UnsplashService.new.get_single_photo_by_keyword(params[:location])
    render json: ImageSerializer.new(Image.new(unsplash_photo))
  end
end
