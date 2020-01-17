class PagesController < ApplicationController
  def home
    @recent_products = Product.most_recent
  end
end
