require 'rails_helper'

describe 'Unsplash API' do
  before(:each) do
    keyword = 'denver,co'

    unsplash = UnsplashService.new
    @photo = unsplash.get_single_photo_by_keyword(keyword)
    @background_image = Image.new(@photo)
  end

  it 'sends background image for city by location', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image[:data][:attributes][:url]).to eq(@background_image.url)
  end
end
