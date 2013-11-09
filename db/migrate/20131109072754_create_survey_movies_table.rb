class CreateSurveyMoviesTable < ActiveRecord::Migration
  def change
    create_table :survey_movies do |t|
      t.belongs_to :survey
      t.belongs_to :movie
      t.datetime :showtime
      t.string :location

      t.timestamps
    end
  end
end
