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
      @user = User.find_by(id: session[:user_id])
    end

    def unread_messages_count_form(user)
      Message.where(sender: user, receiver: current_user, seen: [false, nil]).count
    end
  end

  private

  def redirect_unless_logged_in
    redirect '/sessions/new' unless logged_in?
  end
end
