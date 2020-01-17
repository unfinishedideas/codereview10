class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new()
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # Put flash here
      redirect_to products_path
    else
      # Put flash here
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
      # Put flash here
      redirect_to products_path
    else
      # Put flash here
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    # Put flash here
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
