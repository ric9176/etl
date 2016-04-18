require 'rails_helper'

describe Relationship, type: :model do
  context "Relationship class properties defined" do
    subject(:relationship) { Relationship.new }
    it { should have_db_column(:request_status) }
    it { should have_db_column(:teacher_id) }
    it { should have_db_column(:student_id) }
  end
end
