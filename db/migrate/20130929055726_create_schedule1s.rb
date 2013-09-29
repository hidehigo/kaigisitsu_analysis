class CreateSchedule1s < ActiveRecord::Migration
  def change
    create_table :schedule1s do |t|
      t.date :date
      t.time :time
      t.integer :category
      t.integer :member

      t.timestamps
    end
  end
end
