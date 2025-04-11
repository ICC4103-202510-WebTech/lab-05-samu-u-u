# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [["Fena","fena@example","Quilaqueo"],["Santi","santi@example","Robeson"],["Ana","ana@example","Manriquez"],["Ari","ari@example","......"],["Dani","dani@example","Martinez"],["Diego","diego@example","Lagos"],["Erik","erik@example","Eckell"],["Jorge","jorge@example","Arcuch"],["Matias","matias@example","Kupfer"],["Victor","victor@example","Lozano"]]

users.each do |first_name, email, last_name|
  User.find_or_create_by!(first_name: first_name) do |user|
    user.email = email
    user.last_name = last_name
  end
end

id = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,10]]

id.each do |sender_id,receiver_id|
  Chat.find_or_create_by!(sender_id: sender_id) do |id|
    id.receiver_id = receiver_id
  end
end

id2 = [[1,2,"hola"],[3,4,"cómo"],[5,6,"estás"],[7,8,"bien"],[9,10,"y"],[11,12,"tú"],[13,14,"bien"],[15,16,"también" ],[17,18,"me"],[19,10,"alegro"]]

id2.each do |chat_id,user_id,body|
  Message.find_or_create_by!(chat_id: chat_id) do |id1|
    id1.user_id = user_id
    id1.body = body
  end
end
