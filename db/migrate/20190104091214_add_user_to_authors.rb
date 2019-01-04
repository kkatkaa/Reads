class AddUserToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_reference :authors, :user
  end
end
