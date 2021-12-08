# frozen_string_literal: true

class Chat
  include Mongoid::Document

  embeds_many :messages

  has_and_belongs_to_many :users
end
