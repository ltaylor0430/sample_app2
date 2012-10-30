require 'spec_helper'

describe "PasswordResetsPages" do

	subject { page }

	describe "Reset Password Page" do
   		before { visit new_password_reset_path }
		let (:user)   { FactoryGirl.create(:user) }
 		let (:submit) {"Reset Password"}
     	

 		it { should have_selector('h1', text: 'Reset Password') }
 		it { should have_selector('title', text: 'Reset Password' ) }
 		describe "with valid information" do
 			before do 
 				fill_in "Email", with: user.email  
 				click_button(submit)
 			end
			it { should have_content('Email sent') }
		end
	end
end
