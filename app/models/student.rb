class Student < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
