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
      movie['showtimes'].each do |showtime|

        new_showtime.title = movie['title']

        new_showtime.theater_name = showtime['theatre']['name']
        new_showtime.theater_showtime = showtime['dateTime']
      end
    end


  end
end
