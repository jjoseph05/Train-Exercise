class CreateTrainSchedules < ActiveRecord::Migration
  def change
  	create_table :train_schedules do |t|
  		t.string :schedule
  	end
  end
end
