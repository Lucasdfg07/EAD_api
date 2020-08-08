class TeacherClass < ApplicationRecord
    has_one :class_schedule, dependent: :destroy
    belongs_to :user
end
