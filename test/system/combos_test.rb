require "application_system_test_case"

class CombosTest < ApplicationSystemTestCase
  setup do
    @combo = combos(:one)
  end

  test "visiting the index" do
    visit combos_url
    assert_selector "h1", text: "Combos"
  end

  test "creating a Combo" do
    visit combos_url
    click_on "New Combo"

    fill_in "Description", with: @combo.description
    fill_in "Image url", with: @combo.image_url
    fill_in "Name", with: @combo.name
    fill_in "Price", with: @combo.price
    click_on "Create Combo"

    assert_text "Combo was successfully created"
    click_on "Back"
  end

  test "updating a Combo" do
    visit combos_url
    click_on "Edit", match: :first

    fill_in "Description", with: @combo.description
    fill_in "Image url", with: @combo.image_url
    fill_in "Name", with: @combo.name
    fill_in "Price", with: @combo.price
    click_on "Update Combo"

    assert_text "Combo was successfully updated"
    click_on "Back"
  end

  test "destroying a Combo" do
    visit combos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Combo was successfully destroyed"
  end
end
