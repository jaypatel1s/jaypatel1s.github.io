class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :configure_permitted_parameters, if: :devise_controller?

    protect_from_forgery with: :exception

 
    before_action :initialize_session
    before_action :load_cart

    private

    def initialize_session
      session[:cart] ||= [] # empty cart = empty array
    end

    def load_cart
      @cart = Product.find(session[:cart])
    end

  

    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password,:phone, :address)}
        end
end
