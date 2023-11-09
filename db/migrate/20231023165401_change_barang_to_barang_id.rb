class ChangeBarangToBarangId < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :barang_masuks, :barang, :barang_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
