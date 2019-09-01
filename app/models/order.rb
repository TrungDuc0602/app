class Order < ApplicationRecord
    has_many :line_items, :dependent => :destroy
    PAYMENT_TYPES = [ "Tiền mặt", "Thẻ Visa/master", "Chuyển khoản" ]

    def add_line_items_from_cart(cart) 
        cart.line_items.each do |item|
            item.cart_id = nil
            line_items << item
        end
    end
end
