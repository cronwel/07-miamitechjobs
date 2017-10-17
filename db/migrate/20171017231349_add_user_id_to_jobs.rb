class AddUserIdToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :user_id, :integer
    add_index :jobs, :user_id
  end
end
