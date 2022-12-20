class Classroom < ApplicationRecord
validates :name, :description, presence: true

end
