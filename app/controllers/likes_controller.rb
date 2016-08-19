class LikesController < ApplicationController
def create
    @like = current_user.likes.build(likeable: @likeable)
    @like.likeable =  find_likeable

    if @like.save
      
      render :json =>  {
      :responseCode => 200,
      :responseMessage =>"Liked"
      
     }
    else
 
      render :json =>  {
      :responseCode => 200,
      :responseMessage =>"Error"
      
     }
    end
  end

  def find_likeable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    
  end



end
