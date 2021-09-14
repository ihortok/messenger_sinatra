# frozen_string_literal: true

# MessagesReader service
class MessageReader
  attr_reader :messages

  def initialize(messages)
    @messages = messages
  end

  def call
    messages.where(seen: [false, nil])
            .update(seen: true)
  end
end
