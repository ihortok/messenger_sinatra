# frozen_string_literal: true

# Chat model
class Chat < ActiveRecord::Base
  has_many :chat_members
  has_many :users, through: :chat_members
  has_many :messages, through: :chat_members

  enum access_type: { private: 0, group: 1 }, _suffix: :chat

  validates :name, presence: true, uniqueness: true
end
