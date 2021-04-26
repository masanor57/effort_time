class AddTimeToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :time, :float
  end
end
