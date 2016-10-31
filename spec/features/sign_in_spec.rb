require 'rails_helper'

RSpec.feature "user sign in" do
    scenario "allow user to sign in" do
        visit new_account_session_path
    end
end
