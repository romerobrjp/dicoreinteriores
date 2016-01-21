class CreateAttatchments < ActiveRecord::Migration
  def change
    create_table :attatchments do |t|
      t.attachment :file
      t.references :attachable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
