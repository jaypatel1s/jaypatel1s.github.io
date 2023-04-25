class OrdersController < ApplicationController
    before_action :authenticate_user!, except: [:home,:about,:contact]
    def index
    end
    
    def show
    end
    
    def new
    end
    
    def create      
    end
    
    def edit
    end
    
    def update
    end
    
    def delete
    end
end
