require "test_helper"

class BarangMasuksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barang_masuk = barang_masuks(:one)
  end

  test "should get index" do
    get barang_masuks_url
    assert_response :success
  end

  test "should get new" do
    get new_barang_masuk_url
    assert_response :success
  end

  test "should create barang_masuk" do
    assert_difference("BarangMasuk.count") do
      post barang_masuks_url, params: { barang_masuk: { barang: @barang_masuk.barang, jumlah: @barang_masuk.jumlah, waktu: @barang_masuk.waktu } }
    end

    assert_redirected_to barang_masuk_url(BarangMasuk.last)
  end

  test "should show barang_masuk" do
    get barang_masuk_url(@barang_masuk)
    assert_response :success
  end

  test "should get edit" do
    get edit_barang_masuk_url(@barang_masuk)
    assert_response :success
  end

  test "should update barang_masuk" do
    patch barang_masuk_url(@barang_masuk), params: { barang_masuk: { barang: @barang_masuk.barang, jumlah: @barang_masuk.jumlah, waktu: @barang_masuk.waktu } }
    assert_redirected_to barang_masuk_url(@barang_masuk)
  end

  test "should destroy barang_masuk" do
    assert_difference("BarangMasuk.count", -1) do
      delete barang_masuk_url(@barang_masuk)
    end

    assert_redirected_to barang_masuks_url
  end
end
