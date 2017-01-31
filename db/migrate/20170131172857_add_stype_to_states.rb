class AddStypeToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :stype, :string
  end
end
