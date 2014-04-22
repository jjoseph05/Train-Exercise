class TrainSchedule < ActiveRecord::Base
	has_many :train_listings

	def import(file)
		CSV.foreach(file, {:header_converters => :downcase, :headers => true}) do |row|
		  @schedules.schedule << TrainListing.create(train_line: row['train_line'], 
																						route_name: row['route_name'], 
																						run_number: row['run_number'], 
																						operator_id: row['operator_id'],
																						train_schedule_id: TrainSchedule.last.id)
    end
	end

end
