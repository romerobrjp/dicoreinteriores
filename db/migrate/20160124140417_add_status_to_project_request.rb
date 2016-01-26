class AddStatusToProjectRequest < ActiveRecord::Migration
  def change
    add_column :project_requests, :status, :integer
  end
end
