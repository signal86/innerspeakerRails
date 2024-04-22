class RegisterController < ApplicationController
  def index
    @accounts = Account.all
  end

  def submit
    @username = params[:registration_form][:username]
    @password = params[:registration_form][:password]
    @email = params[:registration_form][:email]

    flash.now[:username] = @username
    flash.now[:password] = @password
    flash.now[:email] = @email

    used = false
    Account.all.each do |acc|
      if acc.username.downcase == @username.downcase
        used = true
        flash.now[:return] = "username not available"
      elsif acc.email.downcase == @email.downcase
        used = true
        flash.now[:return] = "email already registered to another account"
      end
    end
    if !used # create account
      @account = Account.new(username: @username, email: @email)
      @account.password = @password
      if @account.save
        flash.now[:return] = "account made! logging in now"
      else
        flash.now[:return] = "database error!!!!"
      end
    end
    render "index", status: 500
  end
end
