class CreateSpaceTypes < ActiveRecord::Migration
  def change
    create_table :space_types do |t|
      t.string :name
      t.attachment :picture

      t.timestamps null: false
    end
  end
end
