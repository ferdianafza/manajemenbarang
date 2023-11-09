require "test_helper"

class BarangKeluarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barang_keluar = barang_keluars(:one)
  end

  test "should get index" do
    get barang_keluars_url
    assert_response :success
  end

  test "should get new" do
    get new_barang_keluar_url
    assert_response :success
  end

  test "should create barang_keluar" do
    assert_difference("BarangKeluar.count") do
      post barang_keluars_url, params: { barang_keluar: { barang_id: @barang_keluar.barang_id, jumlah: @barang_keluar.jumlah, waktu: @barang_keluar.waktu } }
    end

    assert_redirected_to barang_keluar_url(BarangKeluar.last)
  end

  test "should show barang_keluar" do
    get barang_keluar_url(@barang_keluar)
    assert_response :success
  end

  test "should get edit" do
    get edit_barang_keluar_url(@barang_keluar)
    assert_response :success
  end

  test "should update barang_keluar" do
    patch barang_keluar_url(@barang_keluar), params: { barang_keluar: { barang_id: @barang_keluar.barang_id, jumlah: @barang_keluar.jumlah, waktu: @barang_keluar.waktu } }
    assert_redirected_to barang_keluar_url(@barang_keluar)
  end

  test "should destroy barang_keluar" do
    assert_difference("BarangKeluar.count", -1) do
      delete barang_keluar_url(@barang_keluar)
    end

    assert_redirected_to barang_keluars_url
  end
end
