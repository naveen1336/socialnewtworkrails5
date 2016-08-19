ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :name,:email,:username,:password_digest
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
    
    id_column
    column :name
    column :email
    column :username
     actions
 end


 show do |user|
  attributes_table do
  row :description
	row :name
	row :username
	row :email
  row 'Post Details' do
    ul do
      user.posts.each do |post|
        li "Title = #{post.title}, Comment Count = #{post.comments.count}, Post likes = #{post.likes.count}"
        ul do 
          post.comments.pluck(:comment).map{|x| li x }
        end
      end
    end
  end
  row 'Friends List' do 
    	ul do
       	user.friends.each do |friend|
        	li   friend.name
      	end
	    end
  	end
 	end
  end
end
