class CreateBarangKeluars < ActiveRecord::Migration[7.0]
  def change
    create_table :barang_keluars do |t|
      t.string :barang_id
      t.string :jumlah
      t.string :waktu

      t.timestamps
    end
  end
end
