class TrainListing < ActiveRecord::Base
	validates :train_line, :route_name, :run_number, :operator_id, presence: true
end
