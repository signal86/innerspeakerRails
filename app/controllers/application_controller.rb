class ApplicationController < ActionController::Base
  def index
    @accounts = Account.all
  end
end
