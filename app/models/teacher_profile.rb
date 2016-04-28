class TeacherProfile < ActiveRecord::Base
  belongs_to :teacher

  validates :name, :bio, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
end
