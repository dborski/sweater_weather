class UnsplashService < BaseService
  def initialize
    @base_url = 'https://api.unsplash.com/'
    @unsplash_key = ENV['UNSPLASH_API_KEY']
  end

  def get_photos_by_keyword(keyword)
    city_only = keyword.split(",").first
    params = { query: city_only }
    headers = { Authorization: 'Client-ID ' + @unsplash_key }

    get_json(@base_url, 'search/photos', params, headers)
  end

  def get_single_photo_by_keyword(keyword)
    get_photos_by_keyword(keyword)[:results].first
  end
end
