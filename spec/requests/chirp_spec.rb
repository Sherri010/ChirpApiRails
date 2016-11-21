require 'rails_helper'

describe "Chirps API" do
    it "GET /chirps should return 200" do
        user = User.find(1)

        get "/chirps", headers: {
            "Authorization": "Token token=#{user.auth_token}"
        }

        expect(response).to have_http_status(200)
    end
end
