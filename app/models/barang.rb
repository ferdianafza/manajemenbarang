class Barang < ApplicationRecord
  has_many :barang_masuks
  has_many :barang_keluars


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "kode_barang", "nama_barang", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["barang_masuks", "barang_keluars"]
  end

  def self.search(search)
    if search
      where('nama_barang LIKE ?', "%#{search}%")
    else
      Barang.all
    end
  end

  def self.getTotalBarang
    Barang.count
  end


end
