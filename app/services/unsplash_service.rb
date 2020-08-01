class UnsplashService
  def get_photos_by_keyword(keyword)
    params = { query: keyword }

    get_json('search/photos', params)
  end

  private

  def get_json(url, params)
    response = conn.get(url, params) do |request|
      request.headers['Authorization'] = 'Client-ID ' + ENV['UNSPLASH_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.unsplash.com/') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
