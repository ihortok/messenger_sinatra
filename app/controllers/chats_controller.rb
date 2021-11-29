# frozen_string_literal: true

# ChatsController
class ChatsController < ApplicationController
  get '/chats' do
    redirect_unless_logged_in

    set_users

    erb :'chats/index.html', layout: :'layout.html'
  end

  get '/chats/:user_nickname' do
    redirect_unless_logged_in

    set_users

    return erb :'404.html', layout: :'layout.html' unless receiver

    MessageReader.new(messages.where(sender_id: receiver.id)).call

    erb :'chats/show.html', layout: :'layout.html'
  end

  private

  def set_users
    @users = User.where.not(id: current_user.id)
  end

  def receiver
    @receiver ||= @users.find_by(nickname: params[:user_nickname])
  end

  def messages
    @messages ||= MessagesQuery.new.private_chat_between(current_user.id, receiver.id)
  end
end
