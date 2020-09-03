require 'json'

class NetflixApiService
  def self.parsing
    puts "NETFLIX API LOADING MOVIES..."

    page = 1
    base_url = "https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi"
    results = []

    #THE 'QUERY' NEEDS FIXING
    while page <= 3

      query = "?q=get%3Anew3000%3APT&p=#{page}&t=ns&st=adv"

      url = URI(base_url + "#{query}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
      request["x-rapidapi-key"] =  ENV['RAPID_API_KEY']

      response = http.request(request)
      result = JSON.parse(response.read_body)
      page += 1
      results += result["ITEMS"]
    end
    return results
  end
end
