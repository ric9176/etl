class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :student_profile, dependent: :destroy
  has_many :relationships
  has_many :teachers, through: :relationships
  has_many :class_materials

  def has_a_teacher
    self.relationships.where(request_status: true).any?
  end

  def has_pending_teacher_requests
    self.relationships.where(request_status: false).any?
  end

  def current_teachers
    self.relationships.where(request_status: true)
  end

  def pending_teacher_requests
    self.relationships.where(request_status: false)
  end

  def class_materials_with(teacher)
    self.class_materials.where(teacher_id: teacher.id)
  end

  def has_already_requested(teacher)
    self.relationships.where(teacher_id: teacher.id).any?
  end
end
