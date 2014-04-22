get '/' do
  @listings = TrainListing.all

  haml :index
end
