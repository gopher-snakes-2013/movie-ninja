class AddReleaseStatusToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :release_status, :string
  end
end
