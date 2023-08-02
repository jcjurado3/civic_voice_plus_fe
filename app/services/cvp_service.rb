class CvpService
  def get_digest_bills(user_id, categories, state)
    get_url("api/v1/bills?user_id=#{user_id}&query=#{categories}&state=#{state}")
  end

  def get_user_category(user_id)
    get_url("/api/v1/user_categories?user_id=#{user_id}")
  end

  def save_category(user_id, category_id)
    post_url("/api/v1/user_categories?user_id=#{user_id}&category_id=#{category_id}")
  end

  def save_state(user_id, state)
    state_id = state.to_i
    post_url("/api/v1/user_states?user_id=#{user_id}&state_id=#{state_id}")
  end

  def remove_category(user_id, category_id)
    delete_url("/api/v1/user_categories?user_id=#{user_id}&category_id=#{category_id}")
  end

  def get_user_bills(user_id)
    get_url("/api/v1/user_bills?user_id=#{user_id}")
  end

  def get_all_categories
    get_url("/api/v1/categories")
  end

  def get_user_state(user_id)
    get_url("/api/v1/user_states?user_id=#{user_id}")
  end

  def conn
    Faraday.new(url: "http://localhost:3000") do |f|
    end
  end

  def get_url(url)
    response = conn.get(url)
    if response.status == 404
      "{}"
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def post_url(url)
    # require 'pry'; binding.pry
    response = conn.post(url)
    # require 'pry'; binding.pry
    # JSON.parse(response.body, symbolize_names: true)
  end

  def delete_url(url)
    # require 'pry'; binding.pry
    response = conn.delete do |req|
      req.url url
      req.headers['Content-Type'] = 'application/json'
    end
  
    # JSON.parse(response.body, symbolize_names: true)
  end
end
