require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "index" do 

  # describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	# before { visit user_path(user) }
    before do 
      sign_in user 
      visit user_path

    end 

  	it { should have_content(user.name) }
  	it { should have_title(user.name) }
  end

  
    describe "delete links" do

      it { should_not have_link('delete') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

        it { should have_link('delete', href: user_path(User.first)) }
        it "should be able to delete another user" do
          expect do
            click_link('delete', match: :first)
          end.to change(User, :count).by(-1)
        end
        it { should_not have_link('delete', href: user_path(admin)) }
      end
    end
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

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_title('User Settings') }
      it { should have_button('Update') }
    end

    describe "with invalid information" do
      before { click_button 'Update' }
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:updated_name) { "Updated User" }
      let(:updated_email) { "updated@webboard.com" }
      before do
        fill_in "Name",         with: updated_name
        fill_in "Email",        with: updated_email
        fill_in "Password",     with: user.password
        fill_in "Confirmation", with: user.password
        click_button 'Update'
      end
      it { should have_title(updated_name) }
      it { should have_link('Sign out', href: signout_path) }
      specify { expect(user.reload.name).to eq updated_name }
      specify { expect(user.reload.email).to eq updated_email }
    end
  end
  
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin}

  describe "with admin attribute set to 'true'" do 
    before do 
      @user.save! 
      @user.toggle!(:admin)
    end 

    it { should be_admin }
  end 

end