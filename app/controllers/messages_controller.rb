# frozen_string_literal: true

# MessagesController
class MessagesController < ApplicationController
  post '/messages/create' do
    redirect_unless_logged_in

    message = Message.new(message_params)

    flash[:alert] = message.errors.full_messages.join('; ') unless message.save

    redirect env['HTTP_REFERER']
  end

  private

  def message_params
    params.select { |param, _| %w[receiver_id content].include? param }
          .merge(sender_id: current_user.id, created_at: Time.current)
  end
end
