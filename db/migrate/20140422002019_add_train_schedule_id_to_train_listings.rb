class AddTrainScheduleIdToTrainListings < ActiveRecord::Migration
  def change
  	add_column :train_listings, :train_schedule_id, :integer
  end
end
