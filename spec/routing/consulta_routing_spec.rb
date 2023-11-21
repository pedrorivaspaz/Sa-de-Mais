require "rails_helper"

RSpec.describe ConsultaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/consulta").to route_to("consulta#index")
    end

    it "routes to #show" do
      expect(get: "/consulta/1").to route_to("consulta#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/consulta").to route_to("consulta#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/consulta/1").to route_to("consulta#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/consulta/1").to route_to("consulta#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/consulta/1").to route_to("consulta#destroy", id: "1")
    end
  end
end
