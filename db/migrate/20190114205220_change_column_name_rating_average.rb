class ChangeColumnNameRatingAverage < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :rating_average, :average_ranking
  end
end
