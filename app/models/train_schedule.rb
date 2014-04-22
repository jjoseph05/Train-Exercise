class TrainSchedule < ActiveRecord::Base
	has_many: :train_listings
end
