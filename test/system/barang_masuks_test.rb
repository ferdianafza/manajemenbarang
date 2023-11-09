require "application_system_test_case"

class BarangMasuksTest < ApplicationSystemTestCase
  setup do
    @barang_masuk = barang_masuks(:one)
  end

  test "visiting the index" do
    visit barang_masuks_url
    assert_selector "h1", text: "Barang masuks"
  end

  test "should create barang masuk" do
    visit barang_masuks_url
    click_on "New barang masuk"

    fill_in "Barang", with: @barang_masuk.barang
    fill_in "Jumlah", with: @barang_masuk.jumlah
    fill_in "Waktu", with: @barang_masuk.waktu
    click_on "Create Barang masuk"

    assert_text "Barang masuk was successfully created"
    click_on "Back"
  end

  test "should update Barang masuk" do
    visit barang_masuk_url(@barang_masuk)
    click_on "Edit this barang masuk", match: :first

    fill_in "Barang", with: @barang_masuk.barang
    fill_in "Jumlah", with: @barang_masuk.jumlah
    fill_in "Waktu", with: @barang_masuk.waktu
    click_on "Update Barang masuk"

    assert_text "Barang masuk was successfully updated"
    click_on "Back"
  end

  test "should destroy Barang masuk" do
    visit barang_masuk_url(@barang_masuk)
    click_on "Destroy this barang masuk", match: :first

    assert_text "Barang masuk was successfully destroyed"
  end
end
