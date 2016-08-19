class CommentsController < ApplicationController
def create
    @comment = current_user.comments.build(comments_params)

    if @comment.save
      
      render :json =>  {
      :responseCode => 200,
      :responseMessage =>"commented"
      
     }
    else
     
      render :json =>  {
      :responseCode => 200,
      :responseMessage =>"Error"
      
     }
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:post_id, :content)
    end


end
