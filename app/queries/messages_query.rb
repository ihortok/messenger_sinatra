# frozen_string_literal: true

# Messages query-object
class MessagesQuery
  def personal_for(user_first, user_second)
    Message.where(sender: [user_first, user_second], receiver: [user_first, user_second])
           .includes(:sender)
           .order(created_at: :asc)
  end
end
