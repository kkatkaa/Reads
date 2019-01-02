class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :born
      t.text :description

      t.timestamps
    end
  end
end
