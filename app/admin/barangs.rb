ActiveAdmin.register Barang do
  Formtastic::FormBuilder.perform_browser_validations = true
  permit_params :kode_barang, :nama_barang, :stok

  before_build do |barang|
    barang.stok ||= 0
  end

  form do |f|
    f.inputs do
      f.input :kode_barang
      f.input :nama_barang
      f.input :stok, input_html: { readonly: true }
    end
    f.actions
  end

  filter :kode_barang
  filter :nama_barang
  filter :stok

  scope "Stok Lebih dari 0", :stok_lebih_dari_0, default: true do |barangs|
    barangs.where('stok > 0')
  end

  scope "Stok 0", :stok_0 do |barangs|
    barangs.where(stok: 0)
  end

  csv do
    column :kode_barang
    column :nama_barang
    column :stok
  end
end
