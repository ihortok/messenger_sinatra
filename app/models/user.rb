# frozen_string_literal: true

# User model
class User < ActiveRecord::Base
  has_secure_password

  has_many :chat_members
  has_many :chats, through: :chat_members
  has_many :messages, through: :chat_members

  validates :nickname, presence: true, uniqueness: true
end
