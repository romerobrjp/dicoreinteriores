class AddSpecificIdToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :specific_id, :string
    add_index :preferences, :specific_id, unique: true
  end
end
