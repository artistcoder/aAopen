class ArtworksController < ApplicationController
    protect_from_forgery prepend: true

    # def index
    #     @artworks = Artwork.all
    #     render json: @artworks
    # end
    def index
        artwork = Artwork.find_by(artist_id: params[:user_id])
        artwork_2 = Artwork.find_by(viewer_id: params[:user_id])

    end


    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def show
        artwork = Artwork.find_by(id: params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end

    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork.destroy
            render json: artwork
        else
            render json: "Not possible to delete this user"
        end

    end


    private

    def artwork_params
        params.require(:artwork).permit(:artist_id, :image_url, :title)

    end



end
