class ReviewsController < ApplicationController
  def create
    # Find the parent model (product)
    @product = Product.find(params[:product_id])

    # Initialize a new review using the has_many association
    @review = @product.reviews.build(review_params)

    # Set the user for the review 
    @review.user = current_user

    if @review.save
      # If successful: redirect to appropriate page
      redirect_to product_path(@product), notice: "Review was successfully posted"
    else 
      puts @review.errors.inspect
      # If not successful: render the page where the form resides
      render "products/show"
    end
  end

  private

  def review_params 
    params.require(:review).permit(:description, :rating)
  end
end
