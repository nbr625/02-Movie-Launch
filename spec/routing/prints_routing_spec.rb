require "rails_helper"

RSpec.describe PrintsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prints").to route_to("prints#index")
    end

    it "routes to #new" do
      expect(:get => "/prints/new").to route_to("prints#new")
    end

    it "routes to #show" do
      expect(:get => "/prints/1").to route_to("prints#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prints/1/edit").to route_to("prints#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prints").to route_to("prints#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/prints/1").to route_to("prints#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/prints/1").to route_to("prints#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prints/1").to route_to("prints#destroy", :id => "1")
    end

  end
end
