  # This file should ensure the existence of records required to run the application in every environment (production,
  # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
  # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
  #
  # Example:
  #
  #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
  #     MovieGenre.find_or_create_by!(name: genre_name)
  #   end
  date = Date.new(1983, 2, 19)
  user = User.new(username: "Stu", date_of_birth: date, email: "stu@test.com", password: "123456")
  if user.save
    p "#{user.username} created"
  else
    p "fail"
  end
