# coding: utf-8

class Tasks::DeleteData
  def self.execute
    Schedule1.destroy_all
  end
end



