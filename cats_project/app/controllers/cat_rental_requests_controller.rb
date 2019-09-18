class CatRentalRequestsController < ApplicationController

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


    def deny
        current_cat_rental_request.deny!
        redirect_to cat_url(current_cat)
    end

    def approve
        current_cat_rental_request.approve!
        redirect_to cat_url(current_cat)   
    end




    private


    def cat_rental_request_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
    end

    def current_cat_rental_request
        @rental_request ||=
          CatRentalRequest.includes(:cat).find(params[:id])
    end
    
    def current_cat
        current_cat_rental_request.cat
    end
    

end