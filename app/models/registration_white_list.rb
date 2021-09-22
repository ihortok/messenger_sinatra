# frozen_string_literal: true

# RegistrationWhiteList model
class RegistrationWhiteList < ActiveRecord::Base
  self.table_name = 'registration_white_list'

  validates :email, presence: true
end
