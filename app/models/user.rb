class User < ApplicationRecord
    has_one :connection, dependent: :destroy
    has_one :teacher_class, dependent: :destroy
end
