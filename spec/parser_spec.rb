require_relative '../parser.rb'
require 'rack/test'

set :environment, :test

def app
	Sinatra::Application
end

describe 'Parser Service' do
	include Rack::Test::Methods

	it "should load the home page" do
		get '/'
		last_response.should be_ok
	end

end

describe Parser do

	let(:train_parser) { Parser.new(file) }

	describe "#new" do
		it "returns a new Parser object" do
			@train_parser.should be_an_instance_of Parser
		end
	end
end

