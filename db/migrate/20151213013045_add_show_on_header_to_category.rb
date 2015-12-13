class AddShowOnHeaderToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :show_on_header, :boolean, default: false
  end
end
