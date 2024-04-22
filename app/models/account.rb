require 'bcrypt'

class Account < ApplicationRecord
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    @password_hash = @password
  end
end
