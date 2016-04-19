class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :student_profile, dependent: :destroy
  has_many :relationships
  has_many :teachers, through: :relationships

  def has_a_teacher
    self.relationships.where(request_status: true).any?
  end
end
