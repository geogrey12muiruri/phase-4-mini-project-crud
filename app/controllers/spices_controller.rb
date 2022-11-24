class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :error_message
    def index 
        spices =  Spice.all
        render json: spices, status: :created
    end

    # def show
    #     spice = find_by_id
    #     render json: spice
    # end

    def create
        render json: Spice.create(spice_params), status: :created
    end

    def update
        spice = find_by_id
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_by_id
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_by_id
        Spice.find(params[:id])
    end

    def error_message
        render json: {error: "Spice Not Found"}, status: :not_found
    end
end
