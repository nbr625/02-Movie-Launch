class AddBiographyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biography, :text
    add_column :users, :favorite_movie, :string
  end
end
