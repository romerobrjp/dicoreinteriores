class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :color_1
      t.string :color_2
      t.string :color_3
      t.string :color_4
      t.string :color_5
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
