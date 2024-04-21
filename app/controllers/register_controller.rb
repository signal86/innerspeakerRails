class RegisterController < ApplicationController
  def index
  end

  def submit
    @username = params[:registration_form][:username]
    @password = params[:registration_form][:password]
    @email = params[:registration_form][:email]

    flash.now[:return] = "good"
  end
end
