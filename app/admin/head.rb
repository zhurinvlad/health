ActiveAdmin.register Head do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

show do |at|
    attributes_table do
      row :id
      row :image do
        image_tag(at.image.url(:thumb))
      end
    end
    active_admin_comments
end


form(:html => { :multipart => true }) do |f|
	f.inputs "Attachment" do 
	  f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb)) 
	  f.input :image_cache, :as => :hidden 
	end
	f.actions
end

end
