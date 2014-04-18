require 'spec_helper'
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
  let(:train) { TrainSchedule.new("file.csv") }

  describe "#intialize" do
    it 'has one parameter' do 
      expect { TrainSchedule.new }.to raise_error
    end

  end

  it 'accepts a csv file'
  it 'initializes with an empty array'
  
  describe '#schedule' do
    it 'returns a schedule if it exists'
    it 'calls the parse method if schedule is empty'
  end
end
