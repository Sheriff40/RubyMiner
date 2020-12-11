class Role < ApplicationRecord
  attr_accessor :role_rule
  has_one :role_and_responsibility, dependent: :destroy


  after_create :create_role_and_responsibility

  def create_role_and_responsibility
    role_set = self.build_role_and_responsibility(role_rule: self.role_rule)
    role_set.save!
  end

end