class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :survey_movie
      t.string :name

      t.timestamps
    end
  end
end
