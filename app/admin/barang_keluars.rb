ActiveAdmin.register BarangKeluar do
  before_action :cek_jumlah, only: [:create]
  permit_params :barang_id, :jumlah, :waktu

  form do |f|
    f.inputs do
      f.input :barang, label: 'Barang',
                      as: :select,
                      collection: Barang.where('stok > 0').map { |u| ["#{u.nama_barang}", u.id] },
                      input_html: { required: true }
      f.input :jumlah, required: true, input_html: { type: :number, required: true, id: 'numeric-input' }
      f.input :waktu, as: :datepicker,
                      datepicker_options: {
                        min_date: "-3D",
                        max_date: Date.today.to_date
                      }, input_html: { required: true }
    end
    f.actions

    script do
      raw <<~JAVASCRIPT
        document.addEventListener('DOMContentLoaded', function() {
          var numericInput = document.getElementById('numeric-input');
          numericInput.addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, ''); 
          });
        });
      JAVASCRIPT
    end
  end

  index do
    selectable_column
    column :id
    column :barang do |barang_keluar|
      barang_keluar.barang.nama_barang
    end
    column :jumlah
    column :waktu
    column :created_at
    actions
  end

  filter :barang, collection: proc { Barang.all.map { |u| [u.nama_barang, u.id] } }
  filter :jumlah
  filter :waktu
  filter :created_at

  controller do
    def create
      @barang_keluar = BarangKeluar.new(permitted_params[:barang_keluar])

      if @barang_keluar.save
        update_stok_barang(@barang_keluar.barang, @barang_keluar.jumlah)
        redirect_to admin_barang_keluars_path, notice: "Data Barang Keluar berhasil disimpan."
      else
        render :new
      end
    end

    def destroy
      stok_barang_keluar = BarangKeluar.find(params[:id])
      restore_stok_barang(stok_barang_keluar.barang, stok_barang_keluar.jumlah) if stok_barang_keluar.destroy
      redirect_to admin_barang_keluars_path, notice: "Data Barang Keluar berhasil dihapus."
    end

    private

    def update_stok_barang(barang, jumlah)
      barang = Barang.find(barang.id)
      if barang.stok.to_i >= jumlah.to_i
        barang.stok = barang.stok.to_i - jumlah.to_i
        barang.save
      else
        flash[:error] = "Penambahan Data Barang Keluar Gagal. Jumlah melebihi stok yang tersedia."
        throw(:abort)
      end
    end

    def restore_stok_barang(barang, jumlah)
      barang = Barang.find(barang.id)
      barang.stok = barang.stok.to_i + jumlah.to_i
      barang.save!
    end

    def cek_jumlah
      barang = Barang.find(params[:barang_keluar][:barang_id])
      jumlah = params[:barang_keluar][:jumlah].to_i

      unless barang.stok.to_i >= jumlah
        flash[:error] = "Penambahan Data Barang Keluar Gagal. Jumlah melebihi stok yang tersedia."
        redirect_to new_admin_barang_keluar_path and return
      end
    end
  end
end
