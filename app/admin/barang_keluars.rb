ActiveAdmin.register BarangKeluar do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :barang_id, :jumlah, :waktu
  #
  # or
  #
  # permit_params do
  #   permitted = [:barang_id, :jumlah, :waktu]
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

  filter :barang, collection: proc { Barang.all.map{|u| [u.nama_barang, u.id]} }
  filter :jumlah
  filter :waktu
  filter :created_at
  
  controller do
    def create
      super do |format|
        update_stok_barang(resource.barang, resource.jumlah) if resource.valid?
      end
    end

    private

    def update_stok_barang(barang, jumlah)
      barang = Barang.find(barang.id)
      barang.stok = barang.stok.to_i - jumlah.to_i
      barang.save
    end
  end

end
