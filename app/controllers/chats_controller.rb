# frozen_string_literal: true

# ChatsController
class ChatsController < ApplicationController
  get '/chats' do
    redirect_unless_logged_in

    set_users

    erb :'chats/index.html', layout: :'layout.html'
  end

  get '/chat_with/:user_nickname' do
    redirect_unless_logged_in

    set_users

    return erb :'404.html', layout: :'layout.html' unless receiver

    chat = Chat.find_or_create_by(user_ids: [receiver.id, current_user.id])

    redirect "/chats/#{chat.id}"

    erb :'chats/show.html', layout: :'layout.html'
  end

  get '/chats/:id' do
    set_users

    @chat = Chat.find(params[:id])

    erb :'chats/show.html', layout: :'layout.html'
  end

  post '/chats/:chat_id/message' do
    redirect_unless_logged_in

    Message.create(
      chat: Chat.find(params[:chat_id]),
      content: params[:content],
      sent_by: current_user.nickname,
      created_at: Time.current
    )

    redirect env['HTTP_REFERER']
  end

  private

  def set_users
    @users = User.all_except(current_user)
  end

  def receiver
    @receiver ||= User.all_except(current_user).find_by(nickname: params[:user_nickname])
  end

  def messages
    @messages ||= MessagesQuery.new.private_chat_between(current_user.id, receiver.id)
  end
end
