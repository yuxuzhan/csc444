require 'rails_helper'

RSpec.describe "TournamentAttachments", type: :request do
  describe "GET /tournament_attachments" do
    it "works! (now write some real specs)" do
      get tournament_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
