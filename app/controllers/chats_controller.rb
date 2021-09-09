# frozen_string_literal: true

# ChatsController
class ChatsController < ApplicationController
  before do
    @users = User.all.reject { |user| user == current_user }
  end

  get '/chats' do
    redirect '/sessions/new' unless logged_in?

    erb :'chats/index.html', layout: :'layout.html'
  end

  get '/chats/:name' do
    @chat = Chat.find_by(name: params[:name]) || ChatCteator.new(params[:name]).call

    send_file 'public/404.html' unless @chat

    erb :'chats/show.html', layout: :'layout.html'
  end
end
