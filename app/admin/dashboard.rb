# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    
    columns do
      column do
        panel "Orders" do
          table_for Order.order('id').limit(5).each do |order|
            column (:id) {|order| link_to(order.id, admin_order_path(order)) }    
            column :sub_total 
            column :status    
          end
        end
      end

      column do
        panel "Products" do
          table_for Product.order('id').limit(5).each do |product|
            column (:id) {|product| link_to(product.id, admin_product_path(product)) }   
            column (:name)
          end
        end
      end
     
    end
  end
end
