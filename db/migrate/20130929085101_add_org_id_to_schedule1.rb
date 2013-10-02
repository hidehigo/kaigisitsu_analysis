class AddOrgIdToSchedule1 < ActiveRecord::Migration
  def change
    add_column :schedule1s, :org_id, :int
  end
end
