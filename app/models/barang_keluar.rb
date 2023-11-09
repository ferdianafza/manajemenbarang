class BarangKeluar < ApplicationRecord
  belongs_to              :barang

  scope :filter_by_keluar, ->(created_at) { where(waktu: created_at) }

  def self.ransackable_attributes(auth_object = nil)
    ["barang_id", "created_at", "id", "jumlah", "updated_at", "waktu"]
  end
  def self.getTotalBarangKeluar
    BarangKeluar.count
  end

end
