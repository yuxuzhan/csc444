require "rails_helper"

RSpec.describe TournamentAttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tournament_attachments").to route_to("tournament_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/tournament_attachments/new").to route_to("tournament_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/tournament_attachments/1").to route_to("tournament_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tournament_attachments/1/edit").to route_to("tournament_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tournament_attachments").to route_to("tournament_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tournament_attachments/1").to route_to("tournament_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tournament_attachments/1").to route_to("tournament_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tournament_attachments/1").to route_to("tournament_attachments#destroy", :id => "1")
    end

  end
end
