class UsersController < ApplicationController
	#before_action :findbyid, except: [:create,:login]



def friends
    @title = "Friends"
    @user  = User.find(params[:id])
    @users = @user.friends
    #render 'show_friends'
    render :json =>  {
      :responseCode => 200,
      :responseMessage =>"All friends fetched successfully.",
      :user => @users
      
     }
  end

def feeds
@id = params[:id]
@feeds = User.find(@id).feed
render :json => {
  :feeds => @feeds
}

end

  def inviters
    @id = params[:id]
    @inviters = User.find(@id).inviters
    render :json => {
    	:user => @inviters
    }
  end

def accept_invite
    inviter_id = params[:inviter_id]
    id = params[:id]
    user = User.find(id)
    invite = FriendRequest.find_request(inviter_id, id)
    invite.destroy
    user.add_friend(User.find(inviter_id))
    render :json =>  {
      :responseCode => 200,
      :responseMessage =>"accept invite",
      :user => @users
      
     }
  end


  
  def show
   user = User.find(params[:id])
      @users = User.all - [user]
      render :json =>  {
      :responseCode => 200,
      :responseMessage =>"User shown successfully.",
      :user => @users
      }
  end

 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
      if @user.save!
        render :json =>  {
        :responseCode => 200,
        :responseMessage =>"New User Created successfully.",
        :user => @user  
     }

      else
        render :json =>  {
        :responseCode => 500,
        :responseMessage =>"Error",
        :user => @user
      
     }

    end
  end
 
 def edit
   @user = User.find(params[:id])
  end

  
  def update
     @user = User.find(params[:id]) || User.find(:email => params[:email])
      if @user.update_attributes(user_params)
        render :json =>  {
      :responseCode => 200,
      :responseMessage =>"User is Updated",
      :user => @user
      
     }

      else
        render :json =>  {
      :responseCode => 500,
      :responseMessage =>"Error",
      :user => @user
      
     }

    end
  end

def login
@user = User.find(params[:id])

if @user
	render :json =>  {
      :responseCode => 200,
      :responseMessage =>"User loged in",
      :user => @user
      
     }

 else
 	render :json =>  {
      :responseCode => 200,
      :responseMessage =>"User cannot login",
      :user => @user
      
     }
end
end


  
  def destroy
      @user = User.find(params[:id])
          if @user.destroy
         
         render :json =>  {
      :responseCode => 200,
      :responseMessage =>" User deleted successfully.",
      :user => @user
      
     }
    else
           render :json =>  {
      :responseCode => 500,
      :responseMessage =>"Error",
      :user => @user
      
     }

  end
end

  private

  def findbyid
  	us = User.find(params[:id])

  	end

     def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:username)
    end

end
