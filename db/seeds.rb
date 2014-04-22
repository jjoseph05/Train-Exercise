require 'csv'

TrainSchedule.delete_all
TrainListing.delete_all

@schedule = TrainSchedule.create

CSV.foreach('./trainschedule.csv', {:header_converters => :downcase, :headers => true}) do |row|
	@schedule << TrainListing.create(train_line: row['train_line'], 
																	route_name: row['route_name'], 
																	run_number: row['run_number'], 
																	operator_id: row['operator_id'],
																	train_schedule_id: TrainSchedule.last.id)
end