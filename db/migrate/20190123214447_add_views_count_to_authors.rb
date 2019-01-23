class AddViewsCountToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :views_count, :integer, default: 0
  end
end
