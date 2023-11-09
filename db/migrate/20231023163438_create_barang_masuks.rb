class CreateBarangMasuks < ActiveRecord::Migration[7.0]
  def change
    create_table :barang_masuks do |t|
      t.string :barang
      t.string :jumlah
      t.string :waktu

      t.timestamps
    end
  end
end
