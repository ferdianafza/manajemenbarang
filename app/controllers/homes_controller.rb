class HomesController < ApplicationController
  before_action :authenticate_staff!
    def index
        @listbarang = Barang.search(params[:search])
        @totalBarang = Barang.getTotalBarang
        @totalBarangMasuk = BarangMasuk.getTotalBarangMasuk
        @totalBarangKeluar = BarangKeluar.getTotalBarangKeluar
        @currentEmail = current_staff
    end
end
