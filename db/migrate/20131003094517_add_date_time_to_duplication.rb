class AddDateTimeToDuplication < ActiveRecord::Migration
  def change
    add_column :duplications, :date, :date
    add_column :duplications, :time, :time
  end
end
