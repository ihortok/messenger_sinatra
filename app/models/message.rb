# frozen_string_literal: true

# Message model
class Message
  include Mongoid::Document

  field :content, type: String
  field :sent_by, type: String
  field :seen, type: Boolean, default: false
  field :created_at, type: DateTime

  embedded_in :chat
end
