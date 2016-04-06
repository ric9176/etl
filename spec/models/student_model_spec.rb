require 'rails_helper'

describe Student, type: :model do
  it "Student class implemented" do
    expect(class_exists?("Student"))
    expect(Student < ActiveRecord::Base).to eq(true)
  end
  context "Student class properties defined" do
    subject(:user) { Student.new }
    it { is_expected.to respond_to(:email) }
    it { is_expected.to respond_to(:encrypted_password) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end
  context "Student associations" do
    it "Student 1:1 has_one relationship to Profile in place" do
      expect(Student.reflect_on_association(:student_profile).macro).to eq :has_one
    end
  end
  context "A Student's StudentProfile is deleted when the student is deleted" do
    it "Student model has dependent destroy option" do
      expect(Student.reflect_on_association(:student_profile).options[:dependent]).to eq :destroy
    end
    it "Removes a student's profile from database when a student is deleted" do
      test_student = create(:student)
      test_student.student_profile = StudentProfile.create(name: "Test", native_language: "French", learning_objectives: "Learn english!")
      Student.find(1).destroy
      expect{ (StudentProfile.find(test_student.student_profile.id)) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
