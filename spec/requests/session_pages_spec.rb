require 'spec_helper'

describe "Authenticate" do
	subject { page }

	describe "sign in page" do
		before { visit root_path }
		describe "with invalid information" do
		  before { click_button "Sign In" }
		  it { should have_title("Home") }
		  it { should have_selector('div.alert.alert-danger', text: 'Invalid') }
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email",		with: user.email
				fill_in "Password", with: user.password
				click_button "Sign In"
			end
			it { should have_title(user.name) }
			it { should have_link("Sign out",		href: signout_path) }
			it { should_not have_link("Sign Up", href: signup_path) }

			describe "and signout" do
			  before { click_link 'Sign out' }
			  it { should have_title('Home') }
			  it { should have_link('Sign up') }
			  it { should_not have_link('Sign out') }
			end
		end
		describe "as non-admin user" do
	      let(:user) { FactoryGirl.create(:user) }
	      let(:non_admin) { FactoryGirl.create(:user) }

      		before { sign_in non_admin, no_capybara: true }

	      describe "submitting a DELETE request to the Users#destroy action" do
	        before { delete user_path(user) }
	        specify { expect(response).to redirect_to(root_url) }
	      end
    	end
	end
end
