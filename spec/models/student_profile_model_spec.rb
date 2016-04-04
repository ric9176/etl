require 'rails_helper'

describe StudentProfile, type: :model do
  it "StudentProfile class implemented" do
    expect(class_exists?("StudentProfile"))
    expect(StudentProfile < ActiveRecord::Base).to eq(true)
  end
  context "StudentProfile class properties defined" do
    subject(:user) { StudentProfile.new }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:native_language) }
    it { is_expected.to respond_to(:learning_objectives) }
  end
  context "StudentProfile associations" do
    it "Profile 1:1 belongs_to relationship to Student in place" do
      expect(StudentProfile.reflect_on_association(:student).macro).to eq :belongs_to
    end
  end
end
