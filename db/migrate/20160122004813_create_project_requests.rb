class CreateProjectRequests < ActiveRecord::Migration
  def change
    create_table :project_requests do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :space_type, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
