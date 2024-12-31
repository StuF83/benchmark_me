class RenameAgeToDateOfBirthInUsers < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :age, :date_of_birth
  end
end
