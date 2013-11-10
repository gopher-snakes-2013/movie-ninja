class CreateShowtimesTable < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.string :title
      t.string :tms_id
      t.string :mpaa_rating
      t.integer :release_year
      t.string :theater_name
      t.string :theater_id
      t.datetime :theater_showtime
      t.belongs_to :movie

      t.timestamps
    end
  end
end
