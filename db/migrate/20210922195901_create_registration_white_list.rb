class CreateRegistrationWhiteList < ActiveRecord::Migration[6.1]
  create_table :registration_white_list do |t|
    t.string :email

    t.datetime :created_at, precision: 6, null: false
  end
end
