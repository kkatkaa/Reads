class AddColumnTagsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :tags, :text, array: true, default: []
  end
end
