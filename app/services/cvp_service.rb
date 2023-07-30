class CvpService
  def get_user_bills(user_id)
    get_url("api/v1/user_bills?user_id=#{user_id}")
  end

  def get_user_category(user_id)
    get_url("api/v1/user_category?user_id=#{user_id}")
  end

  def conn
    Faraday.new(url: "https://civic-voice-plus-bfabe77935f8.herokuapp.com/") do |f|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
