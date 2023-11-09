class CreateBarangs < ActiveRecord::Migration[7.0]
  def change
    create_table :barangs do |t|
      t.string :kode_barang
      t.string :nama_barang

      t.timestamps
    end
  end
end
