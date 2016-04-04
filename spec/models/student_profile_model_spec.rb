require 'rails_helper'

describe StudentProfile do
  it "StudentProfile class implemented" do
    expect(class_exists?("StudentProfile"))
    expect(StudentProfile < ActiveRecord::Base).to eq(true)
  end
  context "Student class properties defined" do
    subject(:user) { StudentProfile.new }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:native_language) }
    it { is_expected.to respond_to(:learning_objectives) }
  end
end
