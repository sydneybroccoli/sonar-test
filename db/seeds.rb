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
