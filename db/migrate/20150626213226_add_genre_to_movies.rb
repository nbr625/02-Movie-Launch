class AddGenreToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :genre, :string
    add_column :movies, :new_release, :boolean
  end
end
