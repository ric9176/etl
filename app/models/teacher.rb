class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :teacher_profile, dependent: :destroy
  has_many :relationships
  has_many :materials
  has_many :students, through: :relationships
end
