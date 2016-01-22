require "rails_helper"

RSpec.describe Admin::SpaceTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "admin/space_types").to route_to("admin/space_types#index")
    end

    it "routes to #new" do
      expect(:get => "admin/space_types/new").to route_to("admin/space_types#new")
    end

    it "routes to #edit" do
      expect(:get => "admin/space_types/1/edit").to route_to("admin/space_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "admin/space_types").to route_to("admin/space_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "admin/space_types/1").to route_to("admin/space_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "admin/space_types/1").to route_to("admin/space_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "admin/space_types/1").to route_to("admin/space_types#destroy", :id => "1")
    end

  end
end
