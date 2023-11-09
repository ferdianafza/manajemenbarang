class BarangMasuksController < ApplicationController

  before_action :authenticate_staff!

  def index

    @listBarangMasuk = if params[:created_at].present?
                     BarangMasuk.filter_by_masuk(params[:created_at])
                    else
                     BarangMasuk.all
                    end
    @barangMasukPerHari = BarangMasuk.getTotalBarangMasukPerHari
    @barangMasukPerMinggu = BarangMasuk.getTotalBarangMasukPerMinggu
    @barangMasukPerBulan = BarangMasuk.getTotalBarangMasukPerBulan
    @barangMasukPerTahun = BarangMasuk.getTotalBarangMasukPerTahun
  end

  private
    def barang_masuk_params
      params.require(:barang_masuk).permit(:barang, :jumlah, :waktu)
    end

end
