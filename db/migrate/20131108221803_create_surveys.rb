class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.belongs_to :user
      t.string :url
      t.text :info
      t.datetime :first_available_datetime
      t.datetime :last_available_datetime
      t.string :location_info
      t.string :zipcode

      t.timestamps
    end
  end
end
