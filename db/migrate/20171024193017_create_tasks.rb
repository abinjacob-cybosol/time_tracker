class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :total_hours
      t.integer :project_id
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
