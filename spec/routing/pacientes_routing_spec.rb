require "rails_helper"

RSpec.describe PacientesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pacientes").to route_to("pacientes#index")
    end

    it "routes to #show" do
      expect(get: "/pacientes/1").to route_to("pacientes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/pacientes").to route_to("pacientes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/pacientes/1").to route_to("pacientes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/pacientes/1").to route_to("pacientes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/pacientes/1").to route_to("pacientes#destroy", id: "1")
    end
  end
end
