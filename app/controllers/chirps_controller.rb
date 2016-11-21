class ChirpsController < ApplicationController
    before_action :authenticate

    def index
        render :json => Chirp.all
    end

    def create
        chirp = Chirp.create(chirp_params)

        if chirp.valid?
            render :json => chirp, status: 201
        else
            render :json => {error: "Unable to save chirp"}, status: 400
        end
    end

    def show
        render :json => Chirp.find(params[:id])
    end

    def update
        chirp = Chirp
            .find(params[:id])
            .update_attributes(chirp_params)

        if chirp
            head 200
        else
            render :json => { error: "Cannot update chirp" }, status: 400
        end
    end

    def destroy
        chirp = Chirp.find(params[:id]).destroy

        if chirp
            head 200
        else
            render :json => { error: "Cannot delete chirp" }, status: 400
        end
    end

private

    def chirp_params
        params.require(:chirp).permit(:chirp_text)
    end
end
