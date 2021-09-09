# frozen_string_literal: true

# Message model
class Message < ActiveRecord::Base
  belongs_to :chat_member
end
