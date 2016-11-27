require 'rails_helper'

RSpec.describe "tournament_attachments/show", type: :view do
  before(:each) do
    @tournament_attachment = assign(:tournament_attachment, TournamentAttachment.create!(
      :tournament_id => 2,
      :avatar => "Avatar"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Avatar/)
  end
end
