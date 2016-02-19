class UserMailer < ApplicationMailer
  default from: "Marc@resrun.com"

  def contact_form(email, name, message)
    @message = message
      mail(:from => email,
        :to =>'Marc@resrun.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "The Reservoir Run"
    mail( :to => user.email,
          :subject => "Welcome to #{@ppname}!")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
