namespace :db do
  desc 'parse on_connect json'
  task :parse_json => :environment do
    begin
      require 'dotenv'
      Dotenv.load
    rescue LoadError
    end

    on_connect_json = HTTParty.get("http://data.tmsapi.com/v1/movies/showings?startDate=2013-11-11&zip=94108&api_key=" + ENV['ON_CONNECT_API_KEY'])

    on_connect_json.each do |movie|
      new_showtime = Showtime.new
      new_showtime.title = movie['title']
      new_showtime.tms_id = movie['tmsId']
      new_showtime.mpaa_rating = (movie['ratings'] ? movie['ratings'][0]['code'] : "n/a")
      new_showtime.release_year = movie['releaseYear']
      new_showtime.each do |showtime|
        new_showtime.theater_name = showtime['theatre']['name']
        new_showtime.theater_id = showtime['theatre']['id']
        new_showtime.theater_showtime = showtime['dateTime']
      end
      new_showtime.save
    end


  end
end
