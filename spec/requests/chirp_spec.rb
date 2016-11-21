require 'rails_helper'

describe "Chirps API" do
    before(:each) do
        @user = User.create(email: "test@test.com", password: "Password@1")
    end

    it "GET /chirps should return 200" do
        get "/chirps", headers: {
            "Authorization": "Token token=#{@user.auth_token}"
        }

        expect(response).to have_http_status(200)
    end

    it "POST /chirps should return 201" do
        post "/chirps", params: {
            chirp: {
                chirp_text: "Test Chirp!"
            }
        }, headers: {
            "Authorization": "Token token=#{@user.auth_token}"
        }

        expect(response).to have_http_status(201)
    end

    it "GET /chirps/:id should return 200" do
        chirp = Chirp.create(chirp_text: "Testing Chirps!")

        get "/chirps/#{chirp.id}", headers: {
            "Authorization": "Token token=#{@user.auth_token}"
        }

        expect(response).to have_http_status(200)
    end

    it "PUT /chirps/:id should return 200" do
        chirp = Chirp.create(chirp_text: "Testing Chirps!")

        put "/chirps/#{chirp.id}", params: {
            chirp: {
                chirp_text: "Updated Chirp!"
            }
        }, headers: {
            "Authorization": "Token token=#{@user.auth_token}"
        }

        expect(response).to have_http_status(200)
    end

    it "DELETE /chirps/:id should return 200" do
        chirp = Chirp.create(chirp_text: "Testing Chirps!")

        delete "/chirps/#{chirp.id}", headers: {
            "Authorization": "Token token=#{@user.auth_token}"
        }

        expect(response).to have_http_status(200)
    end
end
