class LoginController < ApplicationController
  def index
    @accounts = Account.all
  end

  def submit
    @username = params[:login_form][:username]
    @password = params[:login_form][:password]

    flash.now[:username] = @username
    flash.now[:password] = @password

    exists = false
    method = ""
    Account.all.each do |acc|
      if acc.username.downcase == @username.downcase
        exists = true
        method = "username"
      elsif acc.email.downcase == @username.downcase
        exists = true
        method = "email"
      else
        flash.now[:return] = "account does not exist"
      end
    end
    if exists
      # @user = Account.find_by(method == "username" ? (username: @username) : (email: @username)) # doesnt work
      # @user = Account.find_by(if method == "username" then username: @username else email: @username end) # also doesnt work
      if method == "username"
        @user = Account.find_by(username: @username)
      elsif method == "email"
        @user = Account.find_by(email: @username)
      else
        flash.now[:return] = "query error"
        render "index", status: 500
        return
      end
      if BCrypt::Password.new(@user.password_hash.to_s) == @password # .new for comparisons between hashed and non hashed
        flash.now[:return] = "verified"
        cookies.encrypted.permanent[:login] = @user.username
        redirect_to "/"
        return
      else
        flash.now[:return] = "wrong password"
      end
      render "index", status: 500
    else
      render "index", status: 500
    end
  end
end
