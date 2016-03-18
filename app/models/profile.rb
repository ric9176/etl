class Profile < ActiveRecord::Base
  has_one :user
end
