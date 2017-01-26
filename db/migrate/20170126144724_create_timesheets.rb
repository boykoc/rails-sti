class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.string :type
      t.string :name

      t.timestamps null: false
    end
  end
end
