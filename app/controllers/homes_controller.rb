class HomesController < ApplicationController
  before_action :authenticate_staff!
    def index
        @listbarang = Barang.search(params[:search]).page params[:page]
        @listBarangKosong = Barang.getListBarangKosong.page params[:page]
        @totalBarang = Barang.getTotalBarang
        @totalBarangMasuk = BarangMasuk.getTotalBarangMasuk
        @totalBarangKeluar = BarangKeluar.getTotalBarangKeluar
        @getTotalBarangKosong = Barang.getTotalBarangKosong
        @currentEmail = current_staff
    end
end
