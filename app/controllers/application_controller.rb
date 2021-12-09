# frozen_string_literal: true

# ApplicationController
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '_sessionSuperSecret_'
    register Sinatra::Flash
  end

  get '/' do
    if logged_in?
      redirect '/chats'
    else
      redirect '/sessions/new'
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      return unless session[:user_id]

      @user = User.find_by(id: session[:user_id])
    end

    def receiver_of(chat)
      chat.users.where.not(id: current_user).first
    end

    def unread_private_messages_count_from(user)
      MessagesQuery.new.private_unread(from: user, to: current_user).count
    end
  end

  private

  def redirect_unless_logged_in
    redirect '/sessions/new' unless logged_in?
  end
end
