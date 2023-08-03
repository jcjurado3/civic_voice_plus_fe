class CvpService
  def dev_conn
    Faraday.new(url: "http://localhost:3000") do |f|
    end
  end

  # def search_url(search, state)
  #   get_url("https://api.legiscan.com/?key=c2f34727aabf37f67164d7029b2fa3c0&op=getSearch&state=#{state}&query=#{search}")
  # end
  
  # def bill_url(bill_id)
  #   get_url("https://api.legiscan.com/?key=c2f34727aabf37f67164d7029b2fa3c0&op=getBill&id=#{bill_id}")
  # end

  def search_url(state, search)
    get_url("/api/v1/bills?state=#{state}&query=#{search}")
  end
  
  # def search_url(state, search)
  #   params = { state: state, search: search}
  #   get_url("/api/v1/bills", params)
  # end

  def bill_url(bill_id)
    get_url("/api/v1/bills/#{bill_id}")
  end
  
  def member_url(bill_id)
    get_url("/api/v1/members/#{bill_id}")
  end

  def save_bills(user_id, bill_id)
    params = { user_id: user_id, bill_id: bill_id }
    post_url("api/v1/user_bills", params)
  end


  def post_url(url, params)
    response = dev_conn.post do |req|
      req.url url
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_url(url)
    response = dev_conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
