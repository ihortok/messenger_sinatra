# frozen_string_literal: true

# SessionsController
class SessionsController < ApplicationController
  get '/sessions/new' do
    redirect '/chats' if logged_in?

    erb :'sessions/new.html', layout: :'layout.html'
  end

  post '/sessions/create' do
    redirect '/chats' if logged_in?

    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/chats'
    else
      erb(
        :'/sessions/new.html',
        layout: :'layout.html',
        locals: { message: 'Email or password is wrong. Please try again.' }
      )
    end
  end

  post '/sessions/destroy' do
    session.clear
    redirect '/sessions/new'
  end
end
