class AddStokToBarang < ActiveRecord::Migration[7.0]
  def change
    add_column :barangs, :stok, :string
  end
end
