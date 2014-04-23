get '/' do
  @listings = TrainListing.all.order(:run_number)

  haml :index
end

post '/upload' do
	@schedule = TrainSchedule.create
	@schedule.schedule = []
  unless params[:file] && (tmpfile = params[:file][:tempfile]) && (name = params[:file][:filename])
    return haml(:index)
  end
  while blk = tmpfile.read(65536)
  	CSV.foreach(params['file'][:tempfile], {:header_converters => :downcase, :headers => true}) do |row|
  		row.to_a
  		@schedule.schedule << TrainListing.create(train_line: row['train_line'], 
																								route_name: row['route_name'], 
																								run_number: row['run_number'], 
																								operator_id: row['operator_id'],
																								created_at: Time.now,
																								updated_at: Time.now,
																								train_schedule_id: TrainSchedule.last.id)
  	end
  end

redirect '/'
end