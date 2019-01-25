class AddColumnImageToAuthor < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :image, :string
  end
end
