class AddDupToSchedule1 < ActiveRecord::Migration
  def change
    add_column :schedule1s, :dup, :boolean
  end
end
