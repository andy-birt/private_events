class RemoveCreatorFromEvents < ActiveRecord::Migration[6.0]
  def change

    remove_column :events, :creator, :string
  end
end
