require "application_system_test_case"

class LineProsTest < ApplicationSystemTestCase
  setup do
    @line_pro = line_pros(:one)
  end

  test "visiting the index" do
    visit line_pros_url
    assert_selector "h1", text: "Line Pros"
  end

  test "creating a Line pro" do
    visit line_pros_url
    click_on "New Line Pro"

    fill_in "Cart", with: @line_pro.cart_id
    fill_in "Product", with: @line_pro.product_id
    fill_in "Quantity", with: @line_pro.quantity
    click_on "Create Line pro"

    assert_text "Line pro was successfully created"
    click_on "Back"
  end

  test "updating a Line pro" do
    visit line_pros_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @line_pro.cart_id
    fill_in "Product", with: @line_pro.product_id
    fill_in "Quantity", with: @line_pro.quantity
    click_on "Update Line pro"

    assert_text "Line pro was successfully updated"
    click_on "Back"
  end

  test "destroying a Line pro" do
    visit line_pros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line pro was successfully destroyed"
  end
end
