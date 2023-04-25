class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
    
         has_many :orders

         validates :email, :phone, uniqueness: true
         validates :phone,length: {is: 10},numericality: { only_integer: true }
   
         after_initialize :abc
         before_validation :valid_before
         after_validation :valid_after
         before_save :save_bef
         after_save  :save_aft
         before_create :create_bef

         before_update :update_bef
         after_update :update_aft
         before_destroy :dest_bef
         after_destroy :dest_aft
         after_commit :comm_aft
     
         def abc
             puts 'Initialize'
         end
     
         def valid_before   
           
         end
     
         def valid_after           
         end
     
         def save_bef
             puts 'save_before successfully'
         end
     
         def save_aft
             puts 'after save'
         end
     
         def create_bef
             self.name = email.capitalize if name.blank?
             puts 'before create'
         end
    
     
         def update_bef
             puts 'before update'
         end
     
         def update_aft
             puts 'Update Successfully'
         end
     
         def dest_bef    
             puts 'delete_before '
         end
     
         def dest_aft
             puts 'delete_after'
         end
     
         def comm_aft
             puts 'after commit'
         end
end
