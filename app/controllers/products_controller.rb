class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # Fetch reviews in reverse chronological order
    @reviews = @product.reviews.order(created_at: :desc)
  end

end
