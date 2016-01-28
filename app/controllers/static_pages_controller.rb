class StaticPagesController < ApplicationController
  
  def index
  	Rails.logger.debug "I am inside index action of static pages controller"
  	# @products = Product.order(:id)
    @products = Product.all
  end

  def about
    Rails.logger.debug "I am inside about action of static pages controller"
  end
  
  def contact
    Rails.logger.debug "I am inside contact action of static pages controller"
  end

  # def register
  #   Rails.logger.debug "I am inside register action of static pages controller"
  # end

    # def home
  #   Rails.logger.debug "I am inside home action of static pages controller"
  #   @products = Product.where(name: 'Res Halfm')
  # end
end
