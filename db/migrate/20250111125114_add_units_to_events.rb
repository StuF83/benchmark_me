class AddUnitsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :units, :string
  end
end
