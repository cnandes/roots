class RemoveColumnsFromBeds < ActiveRecord::Migration[7.0]
  def change
    remove_column :beds, :length
    remove_column :beds, :width
  end
end
