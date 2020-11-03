class Notice < ApplicationRecord
  has_many :user_notices, dependent: :destroy
  has_many :users, through: :user_notices
end
