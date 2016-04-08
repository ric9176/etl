require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
    before { get :home }
    it { should respond_with(200) }
 end

  describe "GET #why_us" do
    before { get :why_us }
    it { should respond_with(200) }
  end

  describe "GET #services" do
    before { get :services }
    it { should respond_with(200) }
  end

  describe "GET #pricing" do
    before { get :pricing }
    it { should respond_with(200) }
  end

  describe "GET #book_a_free_lesson" do
    before { get :book_a_free_lesson }
    it { should respond_with(200) }
  end

  describe "GET #contact" do
    before { get :contact }
    it { should respond_with(200) }
  end

  describe "GET #blog" do
    before { get :blog }
    it { should respond_with(200) }
  end
end
