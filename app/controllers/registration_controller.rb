# frozen_string_literal: true

# RegistrationController
class RegistrationController < ApplicationController
  get '/registration/new' do
    redirect '/chats' if logged_in?

    erb :'registration/new.html', layout: :'layout.html'
  end

  post '/registration/create' do
    redirect '/chats' if logged_in?

    user = User.new(registration_params)

    if user.save
      session[:user_id] = user.id
      redirect '/chats'
    else
      erb(
        :'/registration/new.html',
        layout: :'layout.html',
        locals: { message: user.errors.full_messages.join('; ') }
      )
    end
  end

  private

  def registration_params
    params.select { |param, _| %w[nickname email password].include? param }
  end
end
