get '/' do
  @listings = TrainListing.all.order(:run_number)

  haml :index
end

get '/upload' do
  haml :index
end

# post '/upload' do
#   unless params[:file] && (tmpfile = params[:file][:tempfile]) && (name = params[:file][:filename])
#     return haml(:index)
#   end
#   while blk = tmpfile.read(65536)
#       File.open(File.join(Dir.pwd,"public/uploads", name), "wb") { |f| f.write(tmpfile.read) }
#   end
#  'success'
# end

post '/upload' do
	# @schedule = TrainSchedule.create
	# @schedule.schedule = []
	puts "*=="*80
	
  TrainSchedule.import(params[:filename])
  puts "*=="*80
end