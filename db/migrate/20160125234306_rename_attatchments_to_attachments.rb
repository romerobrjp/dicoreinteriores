class RenameAttatchmentsToAttachments < ActiveRecord::Migration
  def change
    rename_table :attatchments, :attachments
  end
end
