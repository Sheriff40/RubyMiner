class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role_responsibility_system
end
