require "application_system_test_case"

class LineProductsTest < ApplicationSystemTestCase
  setup do
    @line_product = line_products(:one)
  end

  test "visiting the index" do
    visit line_products_url
    assert_selector "h1", text: "Line Products"
  end

  test "creating a Line product" do
    visit line_products_url
    click_on "New Line Product"

    fill_in "Cart", with: @line_product.cart_id
    fill_in "Order", with: @line_product.order_id
    fill_in "Product", with: @line_product.product_id
    fill_in "Quantity", with: @line_product.quantity
    click_on "Create Line product"

    assert_text "Line product was successfully created"
    click_on "Back"
  end

  test "updating a Line product" do
    visit line_products_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @line_product.cart_id
    fill_in "Order", with: @line_product.order_id
    fill_in "Product", with: @line_product.product_id
    fill_in "Quantity", with: @line_product.quantity
    click_on "Update Line product"

    assert_text "Line product was successfully updated"
    click_on "Back"
  end

  test "destroying a Line product" do
    visit line_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Line product was successfully destroyed"
  end
end
