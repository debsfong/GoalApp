class DropGoalColumn < ActiveRecord::Migration
  def change
    remove_column :goals, :private
    add_column :goals, :privacy, :boolean, default: false
  end
end
