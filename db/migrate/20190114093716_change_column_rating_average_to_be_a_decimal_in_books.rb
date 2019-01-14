class ChangeColumnRatingAverageToBeADecimalInBooks < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :rating_average, :decimal
  end
end
