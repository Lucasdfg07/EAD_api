class CreateTeacherClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_classes do |t|
      t.belongs_to :user
      t.string :subject, null: false
      t.float :cost, null: false
    end
  end
end
