class AddUseridToAppjob < ActiveRecord::Migration[6.0]
  def change
    add_column :appjobs, :userid, :integer
    
  
  end
end
