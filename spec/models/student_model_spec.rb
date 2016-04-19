require 'rails_helper'

describe Student, type: :model do
  it "Student class implemented" do
    expect(class_exists?("Student"))
    expect(Student < ActiveRecord::Base).to eq(true)
  end
  context "Student class properties defined" do
    subject(:student) { Student.new }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end
  context "Student associations" do
    it "Student 1:1 has_one relationship to Profile in place" do
      should have_one(:student_profile)
    end
    it "Student has a many:many relationship with Teacher through Relationship" do
      expect(Student.reflect_on_association(:teachers).options[:through]).to eq :relationships 
    end
  end
  context "A Student's StudentProfile is deleted when the student is deleted" do
    it "Student model has dependent destroy option" do
      expect(Student.reflect_on_association(:student_profile).options[:dependent]).to eq :destroy
    end
    it "Removes a student's profile from database when a student is deleted" do
      test_student = create(:student)
      @profile = StudentProfile.create(name: "Test", native_language: "French", learning_objectives: "Learn english!")
      test_student.student_profile = @profile
      Student.find(1).destroy
      expect{ (StudentProfile.find(@profile.id)) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
