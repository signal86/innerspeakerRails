require 'bcrypt'

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
    committed = false
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
      @account = Account.new(username: @username, email: @email, password_hash: BCrypt::Password.create(@password))
      if @account.save
        committed = true
        cookies.encrypted.permanent[:login] = @username
      else
        flash.now[:return] = "database error"
      end
    end
    if committed
      redirect_to "/"
    else
      render "index", status: 500
    end
  end
end
