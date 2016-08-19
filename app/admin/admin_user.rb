ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  actions :all, :except => [:destroy]
config.clear_action_items!
config.filters =false
  index do
    
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    # actions 
    column "Actions" do |f|
      a do
        link_to "View",admin_admin_user_path(f) 
      end
      a do
         link_to "Edit", edit_admin_admin_user_url(f) 
      end
    end
  end

  #filter :email
  #filter :current_sign_in_at
  #filter :sign_in_count
  #filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
