require 'rails_helper'

describe TeacherProfile, type: :model do
  it 'TeacherProfile class implemented' do
    expect(class_exists?('TeacherProfile'))
    expect(TeacherProfile < ActiveRecord::Base).to eq(true)
  end
  context 'TeacherProfile class properties defined' do
    subject(:teacher) { TeacherProfile.new }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:bio) }
  end
  context 'Teacher profile validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:bio) }
  end

  context "TeacherProfile associations" do
      it { should belong_to(:teacher) }
  end
end
