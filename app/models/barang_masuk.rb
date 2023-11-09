class BarangMasuk < ApplicationRecord
  belongs_to              :barang

  scope :filter_by_masuk, ->(created_at) { where(waktu: created_at) }

  def self.ransackable_attributes(auth_object = nil)
    ["barang", "created_at", "id", "jumlah", "updated_at", "waktu"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["barang"]
  end

  def self.getTotalBarangMasuk
    BarangMasuk.count
  end
end
