class BarangKeluar < ApplicationRecord
  belongs_to              :barang

  paginates_per 10

  scope :filter_by_keluar, ->(created_at) { where(waktu: created_at) }

  def self.ransackable_attributes(auth_object = nil)
    ["barang_id", "created_at", "id", "jumlah", "updated_at", "waktu"]
  end
  def self.getTotalBarangKeluar
    BarangKeluar.count
  end

  def self.getTotalBarangKeluarPerHari
    BarangKeluar.where(waktu: Date.today.strftime("%Y-%m-%d")).count
  end

  def self.getTotalBarangKeluarPerMinggu
    start_date = 7.days.ago.beginning_of_day
    end_date = Date.today.end_of_day
    BarangKeluar.where(waktu: start_date..end_date).count
  end

  def self.getTotalBarangKeluarPerBulan
    start_date = 30.days.ago.beginning_of_day
    end_date = Date.today.end_of_day
    BarangKeluar.where(waktu: start_date..end_date).count
  end

  def self.getTotalBarangKeluarPerTahun
    start_date = 365.days.ago.beginning_of_day
    end_date = Date.today.end_of_day
    BarangKeluar.where(waktu: start_date..end_date).count
  end

end
