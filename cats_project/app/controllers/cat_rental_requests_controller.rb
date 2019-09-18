class CatRentalRequestsController < ApplicationController
    
    def show
    end


    def new
        render :new
    end

    def create
        @request = CatRentalRequest.new(cat_rental_request_params)
        @request.status = "PENDING"
        
        if @request.save
            redirect_to cat_url(@request.cat)
        else
            render :new
        end
    end

    private

    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end


end