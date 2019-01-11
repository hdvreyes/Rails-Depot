class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  include PageHit

  before_action :set_page_count, :set_cart
  def index
    @products = Product.order(:title)
    @timestamp = DateTime.now
    @page_count_n = session[:counter]
  end
end
