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

  def self.getTotalBarangMasukPerHari
    BarangMasuk.where(waktu: Date.today.strftime("%Y-%m-%d")).count
  end

  def self.getTotalBarangMasukPerMinggu
    start_date = 7.days.ago.beginning_of_day
    end_date = Date.today.end_of_day
    BarangMasuk.where(waktu: start_date..end_date).count
  end

  def self.getTotalBarangMasukPerBulan
    start_date = 30.days.ago.beginning_of_day
    end_date = Date.today.end_of_day
    BarangMasuk.where(waktu: start_date..end_date).count
  end

  def self.getTotalBarangMasukPerTahun
    start_date = 365.days.ago.beginning_of_day
    end_date = Date.today.end_of_day
    BarangMasuk.where(waktu: start_date..end_date).count
  end
end
