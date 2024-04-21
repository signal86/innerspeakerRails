class RegisterController < ApplicationController
  def index
  end

  def submit
    @username = params[:registration_form][:username]
    @password = params[:registration_form][:password]
    @email = params[:registration_form][:email]

    flash.now[:return] = "good"
    flash.now[:username] = @username
    flash.now[:password] = @password
    flash.now[:email] = @email
    puts "begin"
    render "index", status: 500
    puts "rendered"
  end
end
