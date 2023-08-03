class CvpService
  def dev_conn
    Faraday.new(url: "http://localhost:3000") do |f|
    end
  end
  
  def conn
    Faraday.new(url: "https://civic-voice-plus-api.onrender.com") do |f|
    end
  end
  
  def get_digest_bills(user_id, categories, state)
    get_url("/api/v1/bills?user_id=#{user_id}&query=#{categories}&state=#{state}")
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

  def save_bill(user_id, bill_id)
    post_url("/api/v1/user_bills?user_id=#{user_id}&bill_id=#{bill_id}")
  end

  def unsave_bill(user_id, bill_id)
    delete_url("/api/v1/user_bills?user_id=#{user_id}&bill_id=#{bill_id}")
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

  def search_url(state, search)
    get_url("/api/v1/bills?state=#{state}&query=#{search}")
  end

  def bill_url(bill_id)
    get_url("/api/v1/bills/#{bill_id}")
  end
  
  def member_url(bill_id)
    get_url("/api/v1/members/#{bill_id}")
  end

  def save_bills(user_id, bill_id)
    post_url("api/v1/user_bills?user_id=#{user_id}&bill_id=#{bill_id}")
  end

  def post_url(url)
    response = dev_conn.post(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_url(url)
    response = dev_conn.get(url)
    if response.status == 404
      "{}"
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def delete_url(url)
    response = dev_conn.delete do |req|
      req.url url
      req.headers['Content-Type'] = 'application/json'
    end
    response = dev_conn.get(url)
    JSON.parse(response.body, symbolize_names: true)

  end
end
