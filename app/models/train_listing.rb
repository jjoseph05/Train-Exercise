class TrainListing < ActiveRecord::Base
	belongs_to :train_schedule

	validates :train_line, :route_name, :run_number, :operator_id, presence: true
	validates_uniqueness_of :run_number
end
