ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  permit_params :email, :password, :password_confirmation, :weight, :rating, :growth, :avatar_id

  index do
    selectable_column
    id_column
    column :email
    column :weight
    column :rating
    column :growth
    column :avatar
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :weight
  filter :rating
  filter :growth
  filter :avatar  
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :weight
      f.input :rating
      f.input :growth
      f.input :avatar  
    end
    f.actions
  end


end
