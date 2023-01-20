class AddSeasonToVeggie < ActiveRecord::Migration[7.0]
  def change
    add_column :veggies, :season, :string
  end
end
