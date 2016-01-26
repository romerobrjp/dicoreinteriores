require "rails_helper"

RSpec.describe Customer::ProjectRequestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/customer/project_requests").to route_to("customer/project_requests#index")
    end

    it "routes to #new" do
      expect(:get => "/customer/project_requests/new").to route_to("customer/project_requests#new")
    end

    it "routes to #show" do
      expect(:get => "/customer/project_requests/1").to route_to("customer/project_requests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/customer/project_requests/1/edit").to route_to("customer/project_requests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/customer/project_requests").to route_to("customer/project_requests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/customer/project_requests/1").to route_to("customer/project_requests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/customer/project_requests/1").to route_to("customer/project_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/customer/project_requests/1").to route_to("customer/project_requests#destroy", :id => "1")
    end

  end
end
