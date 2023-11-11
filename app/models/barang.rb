class Barang < ApplicationRecord
  has_many :barang_masuks
  has_many :barang_keluars

  paginates_per 5

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "kode_barang", "nama_barang", "stok", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["barang_masuks", "barang_keluars"]
  end

  def self.search(search)
    if search
      where('nama_barang LIKE ? AND stok > 0', "%#{search}%")
    else
      where('stok > 0')
    end
  end

  def self.getListBarangKosong
    Barang.where('stok = 0')
  end


  def self.getTotalBarangKosong
    Barang.where(stok: 0).count
  end

  def self.getTotalBarang
    Barang.count
  end


end
