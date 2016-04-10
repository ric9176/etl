class TeacherProfile < ActiveRecord::Base
  belongs_to :teacher

  validates :name, :bio, presence: true 
end
