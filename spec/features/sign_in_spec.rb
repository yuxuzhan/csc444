require 'rails_helper'

RSpec.feature "account sign in/up" do
    scenario "disallow user to sign in with non-exist email" do
        visit new_account_session_path

        fill_in "Email" , with: "nobody@example.com"
        fill_in "Password" , with: "password"
        click_on("Log in")

        expect(current_path).to eql(new_account_session_path)
    end
end
