ActiveAdmin.register Project do
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

	form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details",:class => "newproject-page" do
      active_developer_users = User.all
      f.input :name
      f.input :desc, :label => "Definition"
      f.inputs do
      	f.input :user_ids, :as => :select,:collection => User.all, include_blank: "Select some users",:input_html =>{ :class => 'chosen-input', :multiple =>'multiple'},:label => "Team Members"
      end
      f.input :status, :as => :select, :collection => Project.statuses
      f.inputs do
        f.input :start_date, :as => :datepicker,:input_html=>{:value => resource.start_date.try(:strftime,"%Y-%m-%d")}
        f.input :end_date, :as => :datepicker,:input_html=>{:value => resource.end_date.try(:strftime,"%Y-%m-%d") }
      end
      f.input :planned_hours,:as => :string, :input_html => { :maxlength => 15 },:allow_null => true
      # f.input :created_by,:as => :hidden,:input_html => { :value => current_admin_user.email}
    end
    f.actions
  end

	controller do
		def permitted_params
      params.permit project: [:name, :status, :start_date, :end_date, :desc, :planned_hours, user_ids: []]
    end
	end
end
