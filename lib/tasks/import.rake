require 'csv'

namespace :import do
  desc "Import housing from CSV"
  task housing: :environment do
    created = 0
    failed  = 0
    total   = 1

    CSV.foreach('lib/tasks/csvs/HousingData_12.23.17-2.csv', headers: true, header_converters: :symbol) do |row|
      puts "\n\n#################################################################"
      puts "INDEX:          #{total}"
      puts "city:           #{row[:city]}"
      puts "beds:           #{row[:beds]}"
      puts "length_of_stay: #{row[:length_of_stay]}"
      puts "kid_notes:      #{row[:kid_notes]}"
      puts "contact_name:   #{row[:contact_name]}"
      puts "phone_number:   #{row[:phone_number]}"
      puts "email_address:  #{row[:email_address]}"
      puts "notes:          #{row[:notes]}"
      puts "status:         #{row[:status]}"
      puts "verified:       #{row[:verified] || false}"
      puts "paid:           #{row[:paid]}"
      puts "neighborhood:   #{row[:neighborhood]}"
      puts "housing_type:   #{row[:housing_type]}"
      puts "has_animals:    #{row[:has_animals] || false}"
      puts "price:          #{row[:price]}"

      total += 1
      house = Housing.new(user:           User.where(username: "admin").first,
                          city:           row[:city],
                          beds:           row[:beds],
                          length_of_stay: row[:length_of_stay],
                          kid_notes:      row[:kid_notes],
                          contact_name:   row[:contact_name],
                          phone_number:   row[:phone_number],
                          email_address:  row[:email_address],
                          notes:          row[:notes],
                          status:         row[:status],
                          verified:       row[:verified] || false,
                          paid:           row[:paid] || false,
                          neighborhood:   row[:neighborhood],
                          housing_type:   row[:housing_type],
                          has_animals:    row[:has_animals] || false,
                          price:          row[:price])
     if house.save
       created += 1
       puts "INDEX #{total} CREATED"
     else
       failed += 1
       puts "INDEX #{total} FAILED"
     end
      puts "#################################################################"
    end

    puts "TOTAL RUN:"
    puts "FAILED: #{failed}"
    puts "CREATED: #{created}"
    puts "TOTAL: #{total}"

  end
end
