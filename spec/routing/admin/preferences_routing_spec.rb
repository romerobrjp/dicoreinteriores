require "rails_helper"

RSpec.describe Admin::PreferencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/preferences").to route_to("admin/preferences#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/preferences/new").to route_to("admin/preferences#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/preferences/1").to route_to("admin/preferences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/preferences/1/edit").to route_to("admin/preferences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/preferences").to route_to("admin/preferences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/preferences/1").to route_to("admin/preferences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/preferences/1").to route_to("admin/preferences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/preferences/1").to route_to("admin/preferences#destroy", :id => "1")
    end

  end
end
