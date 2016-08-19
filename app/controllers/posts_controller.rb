class PostsController < ApplicationController

before_action :finduser
def create
    @post = @user.posts.build(post_params)
    if @post.save
      
      render :json =>  {
      :responseCode => 200,
      :responseMessage =>"post created",
      :post => @users
      
     }
    else
      @feed_items = []
    end
  end

  def destroy
    @post = @user.posts.find_by(id: params[:id])
    @post.destroy
  
    render :json =>  {
      :responseCode => 200,
      :responseMessage =>"post deleted"
      
     }
  end

def show
  ids = @user.friends.pluck(:id) << @user.id
  @posts = Post.where(user_id: ids)

render :json => {
  :resoponseMessage => "posts fetched successfully",
  :posts => @posts
}

end

  

  private
  def finduser
  @user = User.find_by_id(params[:id])
  end

    def post_params
      params.require(:post).permit(:content,:id)
    end
end
