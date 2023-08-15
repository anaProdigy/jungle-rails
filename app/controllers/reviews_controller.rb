class ReviewsController < ApplicationController
  #to ensure that only logged-in users can create reviews and to protect the reviews_controller actions from unauthorized access
  #authenticate_user! is located in application_controller
  before_action :authenticate_user!, except: [:index, :show]


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

# delete review
  def destroy
 
    @review = Review.find(params[:id])
    @product = @review.product
    @review.destroy
    redirect_to product_path(@product), notice: "Review was successfully deleted."
  end

  private

  def review_params 
    params.require(:review).permit(:description, :rating)
  end
end
