class UnsplashService < BaseService

  def initialize
     @base_url = 'https://api.unsplash.com/'
     @unsplash_key = ENV['UNSPLASH_API_KEY']
  end

  def get_photos_by_keyword(keyword)
    params = { query: keyword }
    headers = { Authorization: 'Client-ID ' + @unsplash_key }

    get_json(@base_url, 'search/photos', params, headers)
  end
end
