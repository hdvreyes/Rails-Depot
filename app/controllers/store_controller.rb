class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  include PageHit

  before_action :set_page_count, :set_cart
  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
    @timestamp = DateTime.now
    @page_count_n = session[:counter]
  end
end
