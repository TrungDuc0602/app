require 'test_helper'

class LineProsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_pro = line_pros(:one)
  end

  test "should get index" do
    get line_pros_url
    assert_response :success
  end

  test "should get new" do
    get new_line_pro_url
    assert_response :success
  end

  test "should create line_pro" do
    assert_difference('LinePro.count') do
      post line_pros_url, params: { line_pro: { cart_id: @line_pro.cart_id, product_id: @line_pro.product_id, quantity: @line_pro.quantity } }
    end

    assert_redirected_to line_pro_url(LinePro.last)
  end

  test "should show line_pro" do
    get line_pro_url(@line_pro)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_pro_url(@line_pro)
    assert_response :success
  end

  test "should update line_pro" do
    patch line_pro_url(@line_pro), params: { line_pro: { cart_id: @line_pro.cart_id, product_id: @line_pro.product_id, quantity: @line_pro.quantity } }
    assert_redirected_to line_pro_url(@line_pro)
  end

  test "should destroy line_pro" do
    assert_difference('LinePro.count', -1) do
      delete line_pro_url(@line_pro)
    end

    assert_redirected_to line_pros_url
  end
end
