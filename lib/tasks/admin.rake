namespace :admin do
  desc "Create Admin Account"
  task create: :environment do
    user = User.new(phone_number: "8055551234", username: "admin", verified: true, role: "admin", password: ENV["ADMIN_PASSWORD"].to_s)

    if user.save
      puts "Created admin account"
    else
      puts "Admin account could not be created"
    end
  end

  desc "Delete Admin Account"
  task destroy: :environment do
    user = User.where(username: "admin").first

    if user && user.destroy
      puts "Deleted admin account"
    else
      puts "Admin account could not be deleted"
    end
  end
end
