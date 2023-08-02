class CvpService
  def get_digest_bills(user_id, categories, state)

    params = { user_id: user_id, categories: categories, state: state }
    get_url("api/v1/bills", params)
  end

  def get_user_category(user_id)
    params = { user_id: user_id }
    get_url("api/v1/user_categories", params)
  end

  def save_category(user_id, category_id)
    params = { user_id: user_id, category_id: category_id }
    post_url("api/v1/user_categories", params)
  end

  def save_state(user_id, state)
    state_id = state.to_i
    params = { user_id: user_id, state_id: state_id}
    post_url("api/v1/user_states", params)
  end

  def remove_category(user_id, category_id)
    params = { user_id: user_id, category_id: category_id }
    delete_url("api/v1/user_categories", params)
  end

  def get_user_bills(user_id)
    params = { user_id: user_id }
    get_url("api/v1/user_bills", params)
  end

  def get_all_categories
    params = {}
    get_url("api/v1/categories")
  end

  def conn
    Faraday.new(url: "http://localhost:3000/") do |f|
    end
  end

  def get_url(url, params = {})
    response = conn.get(url, params)
    if response.status == 404
      "{}"
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def post_url(url, params)
    response = conn.post(url, params.to_json)
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def delete_url(url, params)
    # require 'pry'; binding.pry
    response = conn.delete do |req|
      req.url url
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
  
    # JSON.parse(response.body, symbolize_names: true)
  end
end
