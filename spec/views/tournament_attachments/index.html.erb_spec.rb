require 'rails_helper'

RSpec.describe "tournament_attachments/index", type: :view do
  before(:each) do
    assign(:tournament_attachments, [
      TournamentAttachment.create!(
        :tournament_id => 2,
        :avatar => "Avatar"
      ),
      TournamentAttachment.create!(
        :tournament_id => 2,
        :avatar => "Avatar"
      )
    ])
  end

  it "renders a list of tournament_attachments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
  end
end
