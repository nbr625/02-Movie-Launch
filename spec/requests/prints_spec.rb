require 'rails_helper'

RSpec.describe "Prints", type: :request do
  describe "GET /prints" do
    it "works! (now write some real specs)" do
      get prints_path
      expect(response).to have_http_status(200)
    end
  end
end
