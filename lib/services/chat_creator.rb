# frozen_string_literal: true

# ChatCteator
class ChatCteator
  attr_reader :chat_name

  def initialize(chat_name)
    @chat_name = chat_name
  end

  def call
    nickname_first, nickname_second = chat_name.split('&')

    user_first = User.find_by(nickname: nickname_first)
    user_second = User.find_by(nickname: nickname_second)

    return nil unless user_first && user_second

    chat = Chat.create(name: "#{nickname_first}&#{nickname_second}")

    ChatMember.create(chat: chat, user: user_first)
    ChatMember.create(chat: chat, user: user_second)
  end
end
