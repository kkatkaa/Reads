class AddColumnImageToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :image, :string
  end
end
