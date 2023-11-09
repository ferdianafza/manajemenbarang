class BarangKeluarsController < ApplicationController

  before_action :authenticate_staff!

  def index
    @listBarangKeluar = if params[:created_at].present?
                          BarangKeluar.filter_by_keluar(params[:created_at])
                        else
                          BarangKeluar.all
                        end
  end

  private

    def barang_keluar_params
      params.require(:barang_keluar).permit(:barang_id, :jumlah, :waktu)
    end

end
