namespace :db do
  desc 'get showtimes from on-connect'
  task :seed_showtimes=> :environment do
    begin
      require 'dotenv'
      Dotenv.load
    rescue LoadError
    end

    include RottenTomatoes

    Rotten.api_key = ENV['ROTTEN_API_KEY']

    def search_rt_and_create_by(oc_title)
      rt_movie_data = RottenMovie.find(:title => oc_title, :limit => 1)
      return false if rt_movie_data.empty?
      if found_movie = Movie.find_by_rotten_id(rt_movie_data.id)
        return found_movie
      else
        new_movie = Movie.new
        imdb_id = ( rt_movie_data.alternate_ids ? rt_movie_data.alternate_ids.imdb : "" )
        mob_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.thumbnail : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
        det_poster_url = ( rt_movie_data.posters ? rt_movie_data.posters.detailed : "http://26.media.tumblr.com/tumblr_l5tfabvA2z1qcbewio1_400.jpg" )
        rt_critics_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.critics_score : 0 )
        rt_audience_score = ( rt_movie_data.ratings ? rt_movie_data.ratings.audience_score : 0 )
        release_date = ( rt_movie_data.release_dates ? rt_movie_data.release_dates.theater : "" )

        new_movie.update_attributes({
          title:              rt_movie_data.title.titleize,
          rotten_id:          rt_movie_data.id,
          imdb_id:            imdb_id,
          mob_poster_url:     mob_poster_url,
          det_poster_url:     det_poster_url,
          rt_critics_score:   rt_critics_score,
          rt_audience_score:  rt_audience_score,
          mpaa_rating:        rt_movie_data.mpaa_rating,
          synopsis:           rt_movie_data.synopsis,
          runtime:            rt_movie_data.runtime,
          release_date:       release_date,
          release_status:     "limited"
        })
        return new_movie
      end
    end

    showtime_data = HTTParty.get("http://data.tmsapi.com/v1/movies/showings?startDate=2013-11-13&zip=94108&api_key=" + ENV['ON_CONNECT_API_KEY'])
    showtime_data.each do |movie|
      oc_title = movie['title'].titleize

      movie_to_add_showtimes_to = Movie.find_by_title(oc_title) || search_rt_and_create_by(oc_title) || Movie.find_by_fuzzy_title(oc_title, :limit => 1).first

      tms_id = movie['tmsId']
      movie['showtimes'].each do |showtime|
        new_showtime = movie_to_add_showtimes_to.showtimes.new
        new_showtime.oc_title = oc_title
        new_showtime.tms_id = tms_id
        new_showtime.theater_name = showtime['theatre']['name']
        new_showtime.theater_id = showtime['theatre']['id']
        new_showtime.theater_showtime = showtime['dateTime']
        new_showtime.save
      end
    end
  end
end
