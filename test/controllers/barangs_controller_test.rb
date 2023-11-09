require "test_helper"

class BarangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barang = barangs(:one)
  end

  test "should get index" do
    get barangs_url
    assert_response :success
  end

  test "should get new" do
    get new_barang_url
    assert_response :success
  end

  test "should create barang" do
    assert_difference("Barang.count") do
      post barangs_url, params: { barang: { kode_barang: @barang.kode_barang, nama_barang: @barang.nama_barang } }
    end

    assert_redirected_to barang_url(Barang.last)
  end

  test "should show barang" do
    get barang_url(@barang)
    assert_response :success
  end

  test "should get edit" do
    get edit_barang_url(@barang)
    assert_response :success
  end

  test "should update barang" do
    patch barang_url(@barang), params: { barang: { kode_barang: @barang.kode_barang, nama_barang: @barang.nama_barang } }
    assert_redirected_to barang_url(@barang)
  end

  test "should destroy barang" do
    assert_difference("Barang.count", -1) do
      delete barang_url(@barang)
    end

    assert_redirected_to barangs_url
  end
end
