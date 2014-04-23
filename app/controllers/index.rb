get '/' do
  @listings = TrainListing.all.order(:run_number)

  haml :index
end

get '/upload' do
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
  		puts "*=="*80
  		@schedule.schedule = [] << TrainListing.create(train_line: row['train_line'], 
																								route_name: row['route_name'], 
																								run_number: row['run_number'], 
																								operator_id: row['operator_id'],
																								train_schedule_id: TrainSchedule.last.id)
  	end
  	# TrainSchedule.import(tmpfile)
      # File.open(File.join(Dir.pwd,"public/uploads", name), "wb") { |f| f.write(tmpfile.read) }
  end
 'success'

redirect '/'
end

# post '/upload' do
# 	# @schedule = TrainSchedule.create
# 	# @schedule.schedule = []
# 	puts "*=="*80
# 	p file_data = params[:file][:tempfile].read
#   TrainSchedule.import(file_data)
#   puts "*=="*80

#   haml :index
# end