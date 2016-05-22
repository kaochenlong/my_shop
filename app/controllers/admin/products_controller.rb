class Admin::ProductsController < ApplicationController

  layout "admin"

  def index
  end

  def new
    @product = Product.new
  end

  def create
  end
end
