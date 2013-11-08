class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title
      t.integer :rotten_id
      t.string  :imdb_id
      t.string  :mob_poster_url
      t.string  :det_poster_url
      t.string  :release_date
      t.integer :rt_critics_score
      t.integer :rt_audience_score
      t.string  :mpaa_rating
      t.text    :synopsis
      t.integer :runtime

      t.timestamps
    end
  end
end
