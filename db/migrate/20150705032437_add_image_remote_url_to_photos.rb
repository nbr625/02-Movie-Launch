class AddImageRemoteUrlToPhotos < ActiveRecord::Migration
  def change
    add_column :movies, :image_remote_url, :string
  end
end
