class CreateClassSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :class_schedules do |t|
      t.belongs_to :teacher_class
      t.integer :week_day, null: false
      t.integer :from, null: false
      t.integer :to, null: false
      t.timestamps
    end
  end
end
