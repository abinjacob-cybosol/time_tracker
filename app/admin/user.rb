ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
    selectable_column
    column "Name"do |user|
      link_to user.name, admin_user_path(user)
    end
    column :email do |user|
      user.email
    end
    column :last_sign_in_at do |user|
      user.last_sign_in_at.try(:strftime,'%b %d, %Y')
    end
    column "Tasks" do |user|
      link_to "Tasks", :controller => "tasks", :action => "index", 'q[members_id_eq]' => "#{user.id}".html_safe
    end
    column "Projects" do |user|
      link_to "Projects", :controller => "projects", :action => "index", 'q[members_user_id_eq]' => "#{user.id}".html_safe
    end

  end

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details",:class => "newuser-page" do
      f.input :name
      f.input :email
      f.inputs do
        f.input :password, :input_html => {:autocomplete=>"off" }
        f.input :password_confirmation, :input_html => {:autocomplete=>"off"}
      end
    end
    f.actions
  end

  controller do
  	def permitted_params
      params.permit user: [:name, :email, :password, :password_confirmation]
    end
  end

end
