class StaticPagesController < ApplicationController
  def index
  	Rails.logger.debug "I am inside index action of static pages controller"
  end

  def about
    Rails.logger.debug "I am inside about action of static pages controller"
  end
  
  def contact
    Rails.logger.debug "I am inside contact action of static pages controller"
  end	
end
