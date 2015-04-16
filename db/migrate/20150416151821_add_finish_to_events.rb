class AddFinishToEvents < ActiveRecord::Migration
  def change
    add_column :events, :finish, :string
  end
end
