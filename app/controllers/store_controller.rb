class StoreController < ApplicationController
  def index
    @types = Type.all
    type ||= params[:type]
    type = type.nil? ? type = 1 : type
    @products = Product.where(type_id: type)
  end
end
