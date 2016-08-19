class FriendshipsController < ApplicationController

def create
@user = User.find(params[:id])
@friend = User.find(params[:fid])
  f =  @user.add_friend(@friend)
  

    render :json =>  {
      :responseCode => 200,
      :responseMessage =>"Successfully sent friend request",
      :result => f
     }
  end

  def destroy
  	@user = User.find(params[:id])
  	
  	  
@friendship = @user.friendships.where(:friend_id => params[:fid])
s = @friendship.destroy_all
  
    render  :json => {
    	:responseMessage => "Successfully removed friend",
    	:result => s
    }
  end

  private
def user_params
      params.require(:user).permit(:id,:fid)
    end
end
