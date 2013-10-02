class ChangeCategoryToSchedule1 < ActiveRecord::Migration
  def change
    change_table :schedule1s do |t|
      t.change(:category, :string)
    end
  end
end
