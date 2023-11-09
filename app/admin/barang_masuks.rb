ActiveAdmin.register BarangMasuk do
  menu label: "BarangMasuk"

  permit_params :barang_id, :jumlah, :waktu

  form do |f|
    f.inputs do
      f.input :barang, :label => 'Barang', :as => :select, :collection => Barang.all.map{|u| [u.nama_barang, u.id]}
      f.input :jumlah
      f.input :waktu, as: :datepicker,
                      datepicker_options: {
                        min_date: "-3D",
                        max_date: Date.today.to_date
                      }
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :barang do |barang_masuk|
      barang_masuk.barang.nama_barang
    end
    column :jumlah
    column :waktu
    column :created_at
    actions
  end

  filter :barang, collection: proc { Barang.all.map{|u| [u.nama_barang, u.id]} }
  filter :jumlah
  filter :waktu
  filter :created_at

  controller do
    def create
      super do |format|
        # Lakukan penambahan stok barang
        update_stok_barang(resource.barang, resource.jumlah) if resource.valid?
      end
    end

    private

    def update_stok_barang(barang, jumlah)
      # Dapatkan objek Barang
      barang = Barang.find(barang.id)

      # Set default value for stok if it is nil
      barang.stok ||= 0

      # Tambahkan stok sesuai jumlah
      barang.stok = barang.stok.to_i + jumlah.to_i

      # Simpan perubahan
      barang.save
    end
  end
end
