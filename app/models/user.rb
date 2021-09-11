# frozen_string_literal: true

# User model
class User < ActiveRecord::Base
  has_secure_password

  validates :nickname, presence: true, uniqueness: true
end
