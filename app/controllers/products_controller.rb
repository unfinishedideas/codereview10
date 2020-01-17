class ProductsController < ApplicationController

  def index
    @products = Product.all
    @recent_products = Product.most_recent
    @most_reviewed = Product.most_reviews
    @usa_products = Product.from_usa
    render :index
  end

  def new
    @product = Product.new()
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:alert] = "Something went wrong! Product not created."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:alert] = "Something went wrong! Product not updated."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully destroyed!"
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
