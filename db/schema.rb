# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131110065421) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.integer  "rotten_id"
    t.string   "imdb_id"
    t.string   "mob_poster_url"
    t.string   "det_poster_url"
    t.datetime "release_date"
    t.integer  "rt_critics_score"
    t.integer  "rt_audience_score"
    t.string   "mpaa_rating"
    t.text     "synopsis"
    t.integer  "runtime"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "showtimes", :force => true do |t|
    t.string   "title"
    t.string   "tms_id"
    t.string   "mpaa_rating"
    t.integer  "release_year"
    t.string   "theater_name"
    t.string   "theater_id"
    t.datetime "theater_showtime"
    t.integer  "movie_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "survey_movies", :force => true do |t|
    t.integer  "survey_id"
    t.integer  "movie_id"
    t.datetime "showtime"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.text     "info"
    t.datetime "first_available_datetime"
    t.datetime "last_available_datetime"
    t.string   "location_info"
    t.string   "zipcode"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "survey_movie_id"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
