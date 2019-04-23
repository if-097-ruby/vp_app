class User < ApplicationRecord
        before_save { self.email = email.downcase }
        validates :first_name, :last_name,  presence: true, length: { maximum: 60 }
                          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	    validates :email, presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },	
                          uniqueness: true
  	    validates :password, :presence => true,
                         :confirmation => true,
                         :length => {:within => 6..40},
                         :on => :create
  	    validates :password, :confirmation => true,
                         :length => {:within => 6..40},
                         :on => :update
  	    has_one :organisation_id

end
