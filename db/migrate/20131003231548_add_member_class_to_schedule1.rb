class AddMemberClassToSchedule1 < ActiveRecord::Migration
  def change
    add_column :schedule1s, :member_class, :string
  end
end
