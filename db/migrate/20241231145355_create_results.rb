class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.date :attempt_date
      t.integer :score
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
