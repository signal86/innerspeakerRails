class ApplicationController < ActionController::Base
  include ActionController::Cookies
  helper_method :validUser

  def validUser(username)
    Account.all.each do |acc|
      if acc.username.downcase == username.downcase
        return true
      end
    end
    return false
  end
end
