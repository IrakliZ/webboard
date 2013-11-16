require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }
  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end

  describe "signup" do
    before { visit signup_path }
    it { should have_content('Sign up') }
    it { should have_title(page_title('Sign up')) }

    let(:submit) { "Create Account" }

    describe "with invalid information" do
      it "shouldn't create an user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
    	before do
    		fill_in "Name", 				with: "Test User"
    		fill_in "Email",				with: "user@webboard.com"
    		fill_in "Password",			with: "secretpass"
    		fill_in "Confirmation",	with: "secretpass"
    	end
      it "should create an user" do
        expect { click_button submit }.to change(User, :count)
      end
    end
  end
end