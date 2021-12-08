# frozen_string_literal: true

# User model
class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  field :nickname
  field :email
  field :password_digest

  has_and_belongs_to_many :chats

  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  scope :all_except, ->(user) { where.not(id: user.id) }
end
