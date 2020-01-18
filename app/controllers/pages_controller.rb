class PagesController < ApplicationController
  def home
    @recent_products = Product.most_recent
    @usa_products = Product.from_usa
    @most_reviewed = Product.most_reviews
  end
end
