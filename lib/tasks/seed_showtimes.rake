namespace :db do
  desc 'get showtimes from on-connect'
  task :seed_showtimes=> :environment do
    begin
      require 'dotenv'
      Dotenv.load
    rescue LoadError
    end

    on_connect_json = HTTParty.get("http://data.tmsapi.com/v1/movies/showings?startDate=2013-11-11&zip=94108&api_key=" + ENV['ON_CONNECT_API_KEY'])
    on_connect_json.each do |movie|
      oc_title = movie['title']
      movie_id = Movie.find_by_fuzzy_title(oc_title, :limit => 1).first.id
      tms_id = movie['tmsId']
      mpaa_rating = (movie['ratings'] ? movie['ratings'][0]['code'] : "n/a")
      release_year = movie['releaseYear']
      movie['showtimes'].each do |showtime|
        new_showtime = Showtime.new
        new_showtime.oc_title = oc_title
        new_showtime.movie_id = movie_id
        new_showtime.tms_id = tms_id
        new_showtime.mpaa_rating = mpaa_rating
        new_showtime.release_year = release_year
        new_showtime.theater_name = showtime['theatre']['name']
        new_showtime.theater_id = showtime['theatre']['id']
        new_showtime.theater_showtime = showtime['dateTime']
        new_showtime.save
      end
    end
  end
end
