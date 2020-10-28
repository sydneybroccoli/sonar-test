# REFRESH DB
puts 'Cleaning DB...'
User.destroy_all

puts 'Creating DB...'

# NON-ADMIN USER
User.create!(
  email: 'user@email.com', 
  password:'password', 
  password_confirmation: 'password'
)


# ADMIN USER
User.create!(
  email: 'admin@email.com', 
  password:'password', 
  password_confirmation: 'password',
  admin: true
)

2.times do |n|
  user = User.where(admin: false).first
  file = Upload.create!(
    filename: "file_#{n + 1}",
    filetype: "csv",
    filepath: "file_#{n + 1}.csv",
    user_id: user.id
  )
end

3.times do |n|
  user = User.where(admin: true).first
  file = Upload.create!(
    filename: "upload_#{n + 1}",
    filetype: "csv",
    filepath: "upload_#{n + 1}.csv",
    user_id: user.id
  )
end

if User.all.empty? then
  puts "\tWARNING: YOUR DB CONTAINS NO USERS"
else
  User.all.each do |user|
    if !user.admin then
      puts "\tbasic user account created: " + user.email
    else
      puts "\tadmin user account created: " + user.email
    end
  end
end
