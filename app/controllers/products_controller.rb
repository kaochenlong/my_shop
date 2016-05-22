class ProductsController < ApplicationController
  before_action :initialize_cart

  def index
    @products = Product.all
  end

  def show
  end
end
