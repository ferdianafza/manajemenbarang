require "application_system_test_case"

class BarangKeluarsTest < ApplicationSystemTestCase
  setup do
    @barang_keluar = barang_keluars(:one)
  end

  test "visiting the index" do
    visit barang_keluars_url
    assert_selector "h1", text: "Barang keluars"
  end

  test "should create barang keluar" do
    visit barang_keluars_url
    click_on "New barang keluar"

    fill_in "Barang", with: @barang_keluar.barang_id
    fill_in "Jumlah", with: @barang_keluar.jumlah
    fill_in "Waktu", with: @barang_keluar.waktu
    click_on "Create Barang keluar"

    assert_text "Barang keluar was successfully created"
    click_on "Back"
  end

  test "should update Barang keluar" do
    visit barang_keluar_url(@barang_keluar)
    click_on "Edit this barang keluar", match: :first

    fill_in "Barang", with: @barang_keluar.barang_id
    fill_in "Jumlah", with: @barang_keluar.jumlah
    fill_in "Waktu", with: @barang_keluar.waktu
    click_on "Update Barang keluar"

    assert_text "Barang keluar was successfully updated"
    click_on "Back"
  end

  test "should destroy Barang keluar" do
    visit barang_keluar_url(@barang_keluar)
    click_on "Destroy this barang keluar", match: :first

    assert_text "Barang keluar was successfully destroyed"
  end
end
