# frozen_string_literal: true

# MessagesController
class MessagesController < ApplicationController
  post '/messages/create' do
    message = Message.new(message_params)

    if message.save
      redirect env['HTTP_REFERER']
    else
      erb :'chats/show.html', layout: :'layout.html', locals: { message: 'Something went wrong. Please try again.' }
    end
  end

  private

  def message_params
    params.select { |param, _| %w[receiver_id content].include? param }.merge(sender: current_user)
  end
end
