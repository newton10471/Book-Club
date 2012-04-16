require 'spec_helper'

describe "signup page" do
	subject { page }

	describe "with valid information" do

		before do
			@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
			sign_up @user
		end

		it { should have_selector('div.flash.success', text: 'You will receive an email confirmation once your membership is approved') }
	end
end