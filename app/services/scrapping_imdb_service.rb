class ScrappingImdbService
  STREAMING = []
  def call(url)
    results = fetch_movie_urls(url)
    movies = results.map do |url|
     puts "Scraping #{url}"
     #creating movie with info from imdb
    movie = scrape_movie(url)
    #populate movie info with more info
    add_attributtes(movie)
    #save the complete movie into the DB
    movie.save
    end
  end

  def fetch_movie_urls(url)
    url = url
    doc = Nokogiri::HTML(open(url).read)
    movies = doc.search(".titleColumn a")
    movies.take(3).map do |movie|
      uri = URI.parse(movie.attributes["href"].value)
      uri.scheme = "http"
      uri.host = "www.imdb.com"
      uri.query = nil
      uri.to_s
    end
  end

  def scrape_movie(url)
    doc = Nokogiri::HTML(open(url, "Accept-Language" => "en").read)
    m = doc.search("h1").text.match /(?<title>.*)[[:space:]]\((?<year>\d{4})\)/
    title = m[:title]
    year = m[:year].to_i
    rating = doc.search(".ratingValue").text.strip[0..2].to_f
    genre =  doc.search(".subtext").children[7].text

    Movie.new(title: title,
      imdb_rating: rating,
      genre: genre,
      year: year)
  end

  def add_attributtes(movie)
    movie.streaming_service = STREAMING.sample
  end
end
