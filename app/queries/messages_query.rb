# frozen_string_literal: true

# Messages query-object
class MessagesQuery
  def private_chat_between(user_first, user_second)
    Message.where(sender: [user_first, user_second], receiver: [user_first, user_second])
           .includes(:sender)
           .order(created_at: :asc)
  end

  def private_unread(from:, to:)
    Message.where(sender: from, receiver: to, seen: [false, nil]).count
  end
end
