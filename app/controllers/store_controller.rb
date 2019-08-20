class StoreController < ApplicationController
  def index
    @products = Product.all
    @types = Type.all
  end
end
