class AddColumnRatingAverageToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :rating_average, :integer
  end
end
