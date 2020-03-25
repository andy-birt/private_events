class AddAcceptedToInvites < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :accepted, :boolean
  end
end
