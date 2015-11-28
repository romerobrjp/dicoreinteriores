class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :introduction
      t.text :body, null: false
      t.boolean :draft, default: true

      t.timestamps null: false
    end
  end
end
