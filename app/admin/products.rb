ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :image, :description, :mrp, :selling_price, :discount, :discount_type, :category_id
  form partial: 'form'

  show do
    attributes_table do
      row :image do
        image_tag url_for(product.image.variant(resize: "200x200"))
        
      end
      row :name
      row :description
      row :category_id
      row :mrp
      row :selling_price
      row :discount
      row :discount_type
    end
 end
 
  form do |f|
    f.inputs "Product Details" do
      f.input :category_id, as: :select, collection: Category.all
      f.input :name
      f.input :description
      f.input :mrp
      f.input :selling_price
      f.input :discount
      f.input :discount_type
      f.input :image, as: :file

   
      # more fields
    end
    f.actions
  end
  
  # or
  #
  # permit_params do
  #   permitted = [:name, :image, :description, :mrp, :selling_price, :discount, :discount_type, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
