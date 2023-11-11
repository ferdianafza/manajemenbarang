ActiveAdmin.register BarangMasuk do
  Formtastic::FormBuilder.perform_browser_validations = true
  menu label: "BarangMasuk"

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
        update_stok_barang(resource.barang, resource.jumlah) if resource.valid?
      end
    end

    def destroy
      stok_barang_masuk = BarangMasuk.find(params[:id])
      restore_stok_barang(stok_barang_masuk.barang, stok_barang_masuk.jumlah) if stok_barang_masuk.destroy
      redirect_to admin_barang_masuks_path, notice: "Data Barang Masuk berhasil dihapus."
    end

    private

    def update_stok_barang(barang, jumlah)
      barang = Barang.find(barang.id)
      barang.stok ||= 0
      barang.stok = barang.stok.to_i + jumlah.to_i
      barang.save
    end

    def restore_stok_barang(barang, jumlah)
      barang = Barang.find(barang.id)
      barang.stok = [barang.stok.to_i - jumlah.to_i, 0].max
      barang.save!
    end
  end
  csv do
    column :id
    column :barang do |barang_masuk|
      barang_masuk.barang.nama_barang
    end
    column :jumlah
    column :waktu
    column :created_at
  end
end
