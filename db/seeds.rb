# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user_data = [
  ["Anamaria", "ana@example", "Manriquez"],
  ["Santiago", "santi@example", "Robeson"],
  ["Fernando", "fena@example", "Quilaqueo"],
  ["Dani", "dani@example", "Martinez"]
]

users = user_data.map do |first_name, email, last_name|
  User.find_or_create_by!(email: email) do |user|
    user.first_name = first_name
    user.last_name = last_name
  end
end

chats = []
users.each_slice(2) do |sender, receiver|
  next if receiver.nil?
  chats << Chat.find_or_create_by!(sender_id: sender.id, receiver_id: receiver.id)
end

chats.each_with_index do |chat, index|
  Message.create!(chat: chat, user: chat.sender, body: "Mensaje #{index + 1}")
  Message.create!(chat: chat, user: chat.receiver, body: "Respuesta #{index + 1}")
end

