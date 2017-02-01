class CreateBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :banks do |t|
      t.text :name
      t.string :nbin
      t.string :ifsc_prefix
      t.text :bank_type
      t.boolean :p2a
      t.string :default_ifsc

      t.timestamps
    end
  end
end
