class BaseService
  
  def get_json(base_url, url, params = nil, headers = nil)
    response = conn(base_url).get(url, params, headers) do |request|
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(base_url)
    Faraday.new(url: base_url) do |f|
      f.adapter Faraday.default_adapter
    end
  end
end