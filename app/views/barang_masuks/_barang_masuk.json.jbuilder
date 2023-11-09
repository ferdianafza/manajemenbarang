json.extract! barang_masuk, :id, :barang, :jumlah, :waktu, :created_at, :updated_at
json.url barang_masuk_url(barang_masuk, format: :json)
