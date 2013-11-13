require 'spec_helper'

describe User do
  before { @user = User.new(name: "user", email: "user@webboard.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is missing" do
    before { @user.name = " "}
    it { should_not be_valid }
  end

  describe "when email is missing" do
  	before { @user.email = " "}
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = "a" * 41}
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		emails = %w[@webboard.com user.webboard.com user.com user@webboard,com user@web_board.com user@web+board.com]
  		emails.each do |e|
  			@user.email = e
  			expect(@user).to_not be_valid
  		end
  	end
  end

  describe "when email format is valid" do
  	it "should be valid" do
  		emails = %w[user@webboard.com user@web.board.com user_1@webboard.com user@webboard.COM
  		 user+2@webboard.org user.3@webboard.com]
  		emails.each do |e|
  			@user.email = e
  			expect(@user).to be_valid
  		end
  	end
  end

end
