# frozen_string_literal: true

# ChatMember model
class ChatMember < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user
  has_many :messages
end
