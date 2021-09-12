# frozen_string_literal: true

# ChatsController
class ChatsController < ApplicationController
  before do
    @users = User.where.not(id: current_user)
  end

  get '/chats' do
    redirect '/sessions/new' unless logged_in?

    erb :'chats/index.html', layout: :'layout.html'
  end

  get '/chats/:user_nickname' do
    @receiver = User.find_by(nickname: params[:user_nickname])

    send_file 'public/404.html' unless @receiver

    @messages = Message.where(sender: [current_user, @receiver], receiver: [current_user, @receiver])
                       .includes(:sender)
                       .order(created_at: :asc)

    erb :'chats/show.html', layout: :'layout.html'
  end
end
