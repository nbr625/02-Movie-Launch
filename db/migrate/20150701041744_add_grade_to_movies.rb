class AddGradeToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :grade, :string
    add_column :movies, :year, :integer
  end
end
