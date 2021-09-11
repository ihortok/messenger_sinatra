# frozen_string_literal: true

require 'faker'

User.create(nickname: 'test', email: 'test@test.com', password: '123456abc@') unless User.exists? nickname: :test
User.create(nickname: 'jack', email: 'jack_london@mail.com', password: '123456abc@') unless User.exists? nickname: :jack
User.create(nickname: 'marco', email: 'marco_polo@mail.com', password: '123456abc@') unless User.exists? nickname: :marco
User.create(nickname: 'katy', email: 'katy_perry@mail.com', password: '123456abc@') unless User.exists? nickname: :katy

User.all.each do |user|
  User.where.not(id: user.id).each do |user_|
    Message.create(sender: user, receiver: user_, content: Faker::Lorem.sentence)
  end
end
