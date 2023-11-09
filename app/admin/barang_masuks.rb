ActiveAdmin.register BarangMasuk do
   menu label: "BarangMasuk"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :barang, :barang_id, :jumlah, :waktu
  #
  # or
  #
  # permit_params do
  #   permitted = [:barang, :jumlah, :waktu]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :barang, :label => 'Barang', :as => :select, :collection => Barang.all.map{|u| ["#{u.nama_barang}", u.id]}
      # f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]}
      f.input :jumlah

      f.input :waktu, as: :datepicker,
                      datepicker_options: {
                        min_date: "-3D",
                        max_date: "Date.today.to_date"
                      }

    end
    f.actions
  end

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
      barang.stok += jumlah

      # Simpan perubahan
      barang.save
    end
  end

end
