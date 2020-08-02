require 'rails_helper'

describe 'Image' do
  before(:each) do
    keyword = 'denver,co'

    unsplash = UnsplashService.new
    @photo = unsplash.get_single_photo_by_keyword(keyword)
    @background_image = Image.new(@photo)
  end

  it 'exists', :vcr do
    expect(@background_image).to be_a(Image)
  end

  it 'attributes', :vcr do
    expect(@background_image.url).to eq(@photo[:urls][:raw])
  end
end
