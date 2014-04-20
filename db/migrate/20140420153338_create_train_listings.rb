class CreateTrainListings < ActiveRecord::Migration
  def change
  	create_table :train_listings do |t|
  		t.string :train_line
  		t.string :route_name
  		t.string :run_number
  		t.string :operator_id
  		
  		t.timestamps
  	end
  end
end
