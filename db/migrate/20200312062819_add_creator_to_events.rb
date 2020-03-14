class AddCreatorToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creator, :string
    add_reference :events, :user, foreign_key: true
  end
end
