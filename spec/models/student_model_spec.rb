require 'rails_helper'

describe Student do
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
end
