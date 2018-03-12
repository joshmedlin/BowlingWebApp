class AddInactiveToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :inactive, :boolean
  end
end
