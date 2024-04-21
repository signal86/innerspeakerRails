class LoginController < ApplicationController
  def index
    @accounts = Account.all
  end
end
