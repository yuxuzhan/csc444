require 'rails_helper'

RSpec.describe "tournament_attachments/edit", type: :view do
  before(:each) do
    @tournament_attachment = assign(:tournament_attachment, TournamentAttachment.create!(
      :tournament_id => 1,
      :avatar => "MyString"
    ))
  end

  it "renders the edit tournament_attachment form" do
    render

    assert_select "form[action=?][method=?]", tournament_attachment_path(@tournament_attachment), "post" do

      assert_select "input#tournament_attachment_tournament_id[name=?]", "tournament_attachment[tournament_id]"

      assert_select "input#tournament_attachment_avatar[name=?]", "tournament_attachment[avatar]"
    end
  end
end
