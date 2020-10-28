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

tmp = Upload.create( name: 'file_upload' )
tmp.user_id = User.all[1].id
tmp.file.attach(
  io: File.open("./app/assets/development/cars.csv"),
  filename: "cars.csv",
  content_type: "csv"
)
tmp.save!

# PRINT RESULTS
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
