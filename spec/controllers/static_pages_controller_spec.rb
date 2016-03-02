require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #home" do
   it "returns a 200 OK status" do
     get :home
     expect(response).to have_http_status(:ok)
   end
 end

  describe "GET #why_us" do
    it "returns a 200 OK status" do
      get :why_us
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #services" do
    it "returns a 200 OK status" do
      get :services
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #pricing" do
    it "returns a 200 OK status" do
      get :pricing
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #book_a_free_lesson" do
    it "returns a 200 OK status" do
      get :book_a_free_lesson
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #contact" do
    it "returns a 200 OK status" do
      get :contact
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #blog" do
    it "returns a 200 OK status" do
      get :blog
      expect(response).to have_http_status(:ok)
    end
  end
end
