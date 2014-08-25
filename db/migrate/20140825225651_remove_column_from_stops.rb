class RemoveColumnFromStops < ActiveRecord::Migration
  def change
    remove_column :stops, :number
  end
end
