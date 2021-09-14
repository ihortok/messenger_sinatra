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

    MessageReader.new(messages.where(sender: receiver)).call

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
    @messages ||= Message.where(sender: [current_user, receiver], receiver: [current_user, receiver])
                         .includes(:sender)
                         .order(created_at: :asc)
  end
end
