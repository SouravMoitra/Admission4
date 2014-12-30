require 'spec_helper'

RSpec.describe "Academics", :type => :request do
  describe "GET /academic/new" do
    before do
      get sign_in_path
      fill_in 'user_email', :with => "a1@gmail.com"
      fill_in 'user_password', :with => "foobar20"
      click_button "Log in"
    end
    it "Getting Academics form" do
      get new_academic_path
      expect(response).to have_http_status(200)
    end
  end
end
