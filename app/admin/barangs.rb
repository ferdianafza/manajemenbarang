ActiveAdmin.register Barang do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :kode_barang, :nama_barang, :stok
  #
  # or
  #
  # permit_params do
  #   permitted = [:kode_barang, :nama_barang]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :kode_barang
  filter :nama_barang
  # filter :nama_barang, as: :select, collection: -> { Barang.distinct.pluck(:nama_barang) }
  filter :stok

end
