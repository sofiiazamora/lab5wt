
puts "Creating Users"
10.times do |i|
  User.create!(
    email: "user#{i}@example.com",
    first_name: "Name#{i}",
    last_name: "Last Name#{i}"
  )
end

usuarios = User.all

puts "Creating Chats"
10.times do
  sender = usuarios.sample
  receiver = (usuarios - [sender]).sample

  Chat.create!(
    sender_id: sender.id,
    receiver_id: receiver.id
  )
end

chats = Chat.all

puts "Creating Messages"
10.times do
  chat = chats.sample
  user_id = [chat.sender_id, chat.receiver_id].sample

  Message.create!(
    chat_id: chat.id,
    user_id: user_id,
    body: "Hi, I'm user #{user_id} writting in the chat #{chat.id}"
  )
end

puts "Seeds Created"

