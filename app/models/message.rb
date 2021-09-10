# frozen_string_literal: true

# Message model
class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :chat

  validates :content, presence: true
end
