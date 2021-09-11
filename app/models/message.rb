# frozen_string_literal: true

# Message model
class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :content, presence: true
end
