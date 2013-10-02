class AddColumnToSchedule1 < ActiveRecord::Migration
  def change
    add_column :schedule1s, :room, :string
  end
end
