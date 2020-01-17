require 'pry'

class ReviewsController < ApplicationController

  # def index
  #   # Code for listing all products goes here.
  # end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Something went wrong! Review not created."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @review = Review.find(params[:id])
    @product = Product.find(params[:product_id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_path(@review.product)
    else
      flash[:alert] = "Something went wrong! Review not updated."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully destroyed!"
    redirect_to product_path(@review.product)
  end

  private
  def review_params
    params.require(:review).permit(:author, :rating, :content_body)
  end
end
