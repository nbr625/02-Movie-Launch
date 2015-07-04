class AddGenderToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :origin, :string
    add_column :users, :occupation, :string
  end
end
