# frozen_string_literal: true

# Messages query-object
class MessagesQuery
  def private_chat_between(user_first_id, user_second_id)
    Message.where(sender_id: user_first_id, receiver_id: user_second_id)
           .or(Message.where(sender_id: user_second_id, receiver_id: user_first_id))
           .order(created_at: :asc)
  end

  def private_unread(sender_id:, receiver_id:)
    Message.where(sender_id: sender_id, receiver_id: receiver_id, seen: false)
  end
end
