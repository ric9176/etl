require 'rails_helper'

describe ClassMaterial, type: :model do
  context "ClassMaterial class properties defined" do
    subject(:class_material) { ClassMaterial.new }
    it { should have_db_column(:link) }
    it { should have_db_column(:date) }
    it { should have_db_column(:student_id) }
    it { should have_db_column(:teacher_id) }
  end
end
