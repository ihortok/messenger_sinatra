# frozen_string_literal: true

# ApplicationController
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, '_sessionSuperSecret_'
  end

  get '/' do
    erb :'index.html', layout: :'layout.html'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @user = User.find_by(id: session[:user_id])
    end
  end
end
