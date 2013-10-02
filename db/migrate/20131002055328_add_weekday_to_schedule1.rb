class AddWeekdayToSchedule1 < ActiveRecord::Migration
  def change
    add_column :schedule1s, :weekday, :string
  end
end
