ActiveAdmin.register Product do

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
  
  permit_params :name,  :name, :description, :price, :status, :image_url, :discount, :type_id

  index do
    selectable_column
  
    column :name
    column :description
    column :price
    column :status
    column :image_url
    column :discount
    column :type_id
    actions
  end

  filter :name

  index as: :grid, columns: 2 do |product|
    link_to image_tag(product.image_url), admin_product_path(product)
    
  end

  config.per_page = 15

  index download_links: false
  index download_links: [:pdf]
  index download_links: proc{ current_user.can_view_download_links? }

end
