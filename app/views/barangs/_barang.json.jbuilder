json.extract! barang, :id, :kode_barang, :nama_barang, :created_at, :updated_at
json.url barang_url(barang, format: :json)
