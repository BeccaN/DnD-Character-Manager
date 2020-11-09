class User < ActiveRecord::Base
    has_secure_password
    has_many :characters
    validates :name, :password, :email, presence: true
end
