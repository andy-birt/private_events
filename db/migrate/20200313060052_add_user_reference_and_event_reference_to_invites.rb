class AddUserReferenceAndEventReferenceToInvites < ActiveRecord::Migration[6.0]
  def change
    add_reference :invites, :user, foreign_key: true
    add_reference :invites, :event, foreign_key: true
  end
end
