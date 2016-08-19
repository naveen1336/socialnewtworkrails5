ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
permit_params :title,:content,:user_id,:likeable_id,:likeable_type
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do 
	    id_column
	    column :title
	    column :content
	    #column :comment_count do |c|
	    #	c.comments.count
	    #end
	    column :like_count do |c|
	    	c.likes.count
	    end
	    actions
	end



end
