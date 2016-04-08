require 'rails_helper'

describe StudentProfile, type: :model do
  it 'StudentProfile class implemented' do
    expect(class_exists?('StudentProfile'))
    expect(StudentProfile < ActiveRecord::Base).to eq(true)
  end
  context 'StudentProfile class properties defined' do
    subject(:user) { StudentProfile.new }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:native_language) }
    it { is_expected.to respond_to(:learning_objectives) }
  end
  context 'Student profile validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:native_language) }
    it { should validate_presence_of(:learning_objectives) }
  end

  context "StudentProfile associations" do
    context "Profile 1:1 belongs_to relationship to Student in place" do
      it { should belong_to(:student) }
    end
  end
end
