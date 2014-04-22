get '/' do
  @listings = TrainListing.all.order(:run_number)

  haml :index
end

get '/upload' do
  haml :index
end

