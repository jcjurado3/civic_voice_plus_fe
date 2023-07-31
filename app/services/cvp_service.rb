class CvpService
  def conn
    Faraday.new(url: "http://localhost:3000/") do |f|
    end
  end

  def search_url(search, state)
    get_url("https://api.legiscan.com/?key=c2f34727aabf37f67164d7029b2fa3c0&op=getSearch&state=#{state}&query=#{search}")
  end

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
