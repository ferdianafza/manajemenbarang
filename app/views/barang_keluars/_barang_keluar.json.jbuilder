json.extract! barang_keluar, :id, :barang_id, :jumlah, :waktu, :created_at, :updated_at
json.url barang_keluar_url(barang_keluar, format: :json)
