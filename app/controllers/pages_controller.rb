class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @products = Product.where('stock > ?', 0)
  end
end
