require 'rails_helper'

RSpec.describe "tournament_attachments/new", type: :view do
  before(:each) do
    assign(:tournament_attachment, TournamentAttachment.new(
      :tournament_id => 1,
      :avatar => "MyString"
    ))
  end

  it "renders new tournament_attachment form" do
    render

    assert_select "form[action=?][method=?]", tournament_attachments_path, "post" do

      assert_select "input#tournament_attachment_tournament_id[name=?]", "tournament_attachment[tournament_id]"

      assert_select "input#tournament_attachment_avatar[name=?]", "tournament_attachment[avatar]"
    end
  end
end
