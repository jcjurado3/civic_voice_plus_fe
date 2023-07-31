class CvpService
  def get_digest_bills(user_id, categories, state)
    params = { user_id: user_id, categories: categories, state: state }
    get_url("api/v1/digest_bills", params)
  end

  def get_user_category(user_id)
    params = { user_id: user_id }
    get_url("api/v1/user_category", params)
  end

  def save_category(user_id, category_id)
    params = { user_id: user_id, category_id: category_id }
    post_url("api/v1/user_category", params)
  end

  def remove_category(user_id, category_id)
    params = { user_id: user_id, category_id: category_id }
    delete_url("api/v1/user_category", params)
  end

  def get_user_bills(user_id)
    params = { user_id: user_id }
    post_url("api/v1/user_bills", params)
  end

  def get_all_categories
    params = {}
    get_url("api/v1/categories")
  end

  def conn
    Faraday.new(url: "https://civic-voice-plus-bfabe77935f8.herokuapp.com/") do |f|
    end
  end

  def get_url(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_url(url, params)
    response = conn.post do |req|
      req.url url
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_url(url, params)
    response = conn.delete do |req|
      req.url url
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
