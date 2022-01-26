class PolyLikesController < ApplicationController
    def create
        poly_like = PolyLike.where(likeable_id:params[:likeable_id], likeable_type:params[:likeable_type], user_id: current_user.id)
        if poly_like.present?
            @poly_like = poly_like
            @poly_like.update(emoji:params[:emoji].to_i)
            @post = Post.find(params[:likeable_id]) if params[:likeable_type] == "Post"
            @girl = Girl.find(params[:likeable_id]) if params[:likeable_type] == "Girl"
            if params[:likeable_type] == "Post"
                render :create
            else
                render :like_girl
            end
        else
            @poly_like = PolyLike.new
            @poly_like.likeable_id = params[:likeable_id]
            @poly_like.likeable_type = params[:likeable_type]
            @post = Post.find(params[:likeable_id]) if params[:likeable_type] == "Post"
            @girl = Girl.find(params[:likeable_id]) if params[:likeable_type] == "Girl"
            if params[:emoji]
                @poly_like.emoji = params[:emoji].to_i
            end
            @poly_like.user_id = current_user.id if current_user.present?
            if @poly_like.save
                @girl = Girl.find(params[:likeable_id]) if params[:likeable_type] == "Girl"
                if params[:likeable_type] == "Post"
                    render :create
                else
                    render :like_girl
                end
            else
                render :form_error
            end
        end
    end

    def delete_like
        like = Girl.find(params[:likeable_id]).poly_likes.where(user_id:current_user.id, likeable_type: "Girl", likeable_id:params[:likeable_id])
        @like = PolyLike.find(like[0].id)
        @like.destroy
        render :delete_like
    end

    private

    def poly_like_params
        params.require(:poly_like).permit(:user, :emoji, :likeable_id, :likeable_type)
    end
end
