class AddColumnNumberToStops < ActiveRecord::Migration
  def change
    add_column :stops, :number, :integer
  end
end
