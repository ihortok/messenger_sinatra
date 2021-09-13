# frozen_string_literal: true

# ChatsController
class ChatsController < ApplicationController
  get '/chats' do
    redirect_unless_logged_in

    @users = User.where.not(id: current_user.id)

    erb :'chats/index.html', layout: :'layout.html'
  end

  get '/chats/:user_nickname' do
    redirect_unless_logged_in

    @users = User.where.not(id: current_user.id)

    @receiver = @users.find_by(nickname: params[:user_nickname])

    return erb :'404.html', layout: :'layout.html' unless @receiver

    @messages = Message.where(sender: [current_user, @receiver], receiver: [current_user, @receiver])
                       .includes(:sender)
                       .order(created_at: :asc)

    erb :'chats/show.html', layout: :'layout.html'
  end
end
