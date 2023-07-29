class CvpService
  def conn
    Faraday.new(url: "http://localhost:3000/") do |f|
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
