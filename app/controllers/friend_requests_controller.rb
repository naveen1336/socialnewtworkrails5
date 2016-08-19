class FriendRequestsController < ApplicationController


def create
    current_user = User.find(params[:id])
    user = User.find(params[:fid])
    user.invite(current_user)
     render :json =>  {
      :responseCode => 200,
      :responseMessage =>"friend request send"
      
     }
  end

  def show
    @user = User.find(params[:id])
     @requests = @user.friend_requests
     render :json =>  {
      :responseCode => 200,
      :request => @requests 
      
     }
  end

def accept
@request_id = FriendRequest.find(params[:rid])
@user = User.find(@request_id.user_id)
@friend = User.find(@request_id.friend_id)

@a = @user.accept_invite(@friend)
if @a
render :json =>  {
      :responseCode => 200,
      :responseMessage => "friend request accepted"
      :result => @a 
      
     }

   else
    render :json =>  {
      :responseCode => 203,
      :responseMessage => "no friend requests" 
      
     }
   end
end

def private

params.require(:user).permit(:id,:fid,:rid)
end


end
