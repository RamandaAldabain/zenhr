class AddSeenToAppjob < ActiveRecord::Migration[6.0]
  def change
    add_column :appjobs, :seen, :integer
  end
end
