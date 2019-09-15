class CommentsController < ApplicationController
    def index
        # @comments = Comment.where
        # if params[:user_id]
        #     @comments = Comment.where(author_id: params[:user_id])
        # elsif params[:artwork_id]
        #     @comments = Comment.where(artwork_id: params[:artwork_id])
        # end

        # render json: @comments
        case
        when params[:user_id]
          comments = Comment.where(user_id: params[:user_id])
        when params[:artwork_id]
          comments = Comment.where(artwork_id: params[:artwork_id])
        else
          comments = Comment.all
        end
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end

    end

    def destroy
        comment= Comment.find(params[:id])
        comment.destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:artwork_id, :author_id, :body)
    end

end
