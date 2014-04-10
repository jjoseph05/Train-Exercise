require_relative '../train_schedule.rb'

require 'rack/test'

set :environment, :test

def app
 Sinatra::Application
end

describe 'TrainSchedule Service' do
  include Rack::Test::Methods

  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
end

describe TrainSchedule do
  let(:train_schedule) { TrainSchedule.new(file) }

  
  describe "#new" do
    it "returns a new TrainSchedule object" do
      train_schedule.should be_an_instance_of TrainSchedule
    end
  end
end

