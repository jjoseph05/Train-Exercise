require 'csv'

TrainSchedule.delete_all
TrainListing.delete_all

schedule = TrainSchedule.new

CSV.foreach('./trainschedule.csv', {:header_converters => :downcase, :headers => true}) do |row|
	schedule << TrainListing.create( row['train_line'], row['route_name'], row['run_number'], row['operator_id'] )
	  User.create :first_name => Faker::Name.first_name,
              :last_name  => Faker::Name.last_name,
              :email      => Faker::Internet.email,
end