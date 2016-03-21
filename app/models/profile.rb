class Profile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :teacher, dependent: :destroy
end
