class StudentProfile < ActiveRecord::Base
  belongs_to :student
  validates :name, :native_language, :learning_objectives, presence: true 
end
