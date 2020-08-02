require 'rails_helper'

describe 'Unsplash API' do
  before(:each) do
    keyword = 'denver,co'

    unsplash = UnsplashService.new
    @unsplash_photos = unsplash.get_photos_by_keyword(keyword)
    @photo = unsplash.get_single_photo_by_keyword(keyword)
  end

  it 'sends photos by keyword search', :vcr do
    expect(@unsplash_photos[:results]).to be_a(Array)
    expect(@unsplash_photos[:results].first).to have_key(:id)
    expect(@unsplash_photos[:results].first).to have_key(:created_at)
    expect(@unsplash_photos[:results].first).to have_key(:updated_at)
    expect(@unsplash_photos[:results].first).to have_key(:width)
    expect(@unsplash_photos[:results].first).to have_key(:height)
    expect(@unsplash_photos[:results].first).to have_key(:color)
    expect(@unsplash_photos[:results].first).to have_key(:description)
    expect(@unsplash_photos[:results].first).to have_key(:alt_description)
    expect(@unsplash_photos[:results].first[:urls]).to have_key(:raw)
    expect(@unsplash_photos[:results].first[:urls]).to have_key(:full)
    expect(@unsplash_photos[:results].first[:urls]).to have_key(:regular)
    expect(@unsplash_photos[:results].first[:urls]).to have_key(:thumb)
    expect(@unsplash_photos[:results].first[:links]).to have_key(:self)
    expect(@unsplash_photos[:results].first[:links]).to have_key(:html)
    expect(@unsplash_photos[:results].first[:links]).to have_key(:download)
    expect(@unsplash_photos[:results].first[:links]).to have_key(:download_location)
  end

  it 'gets a single photo', :vcr do
    expect(@photo).to be_a(Hash)
    expect(@photo).to have_key(:id)
    expect(@photo).to have_key(:created_at)
    expect(@photo).to have_key(:updated_at)
    expect(@photo).to have_key(:width)
    expect(@photo).to have_key(:height)
    expect(@photo).to have_key(:color)
    expect(@photo).to have_key(:description)
    expect(@photo).to have_key(:alt_description)
    expect(@photo[:urls]).to have_key(:raw)
    expect(@photo[:urls]).to have_key(:full)
    expect(@photo[:urls]).to have_key(:regular)
    expect(@photo[:urls]).to have_key(:thumb)
    expect(@photo[:links]).to have_key(:self)
    expect(@photo[:links]).to have_key(:html)
    expect(@photo[:links]).to have_key(:download)
    expect(@photo[:links]).to have_key(:download_location)
  end
end
