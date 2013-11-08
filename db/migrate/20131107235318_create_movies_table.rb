class CreateMoviesTable < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title
      t.integer :rotten_id
      t.string  :imdb_ref
      t.string  :poster_url
      t.integer :rt_score
      t.string  :mpaa_rating
      t.text    :synopsis
      t.string  :runtime

      t.timestamps
    end
  end
end
