# frozen_string_literal: true

# Message model
class Message
  include Mongoid::Document

  field :content, type: String
  field :sender_id, type: Integer
  field :receiver_id, type: Integer
  field :seen, type: Boolean, default: false
  field :created_at, type: DateTime

  def sender
    User.find_by(id: sender_id)
  end

  def receiver
    User.find_by(id: receiver_id)
  end
end
