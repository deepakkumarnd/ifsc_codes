class AddPriorityToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :priority, :integer, default: 0
  end
end
