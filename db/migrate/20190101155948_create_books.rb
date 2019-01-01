class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :pages
      t.string :date
      t.integer :isbn
      t.string :language

      t.timestamps
    end
  end
end
