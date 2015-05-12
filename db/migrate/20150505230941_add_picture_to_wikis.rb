class AddPictureToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :picture, :string
  end
end
