class User < ActiveRecord::Base
    has_secure_password
    has_many :characters

    validates :name, :email, presence: true
    validates :name, :password, length: { minimum: 5 }
    validates :email, format: { with: /(@.*[.]com)\z/,
        message: "must include '@' symbol and end with '.com'" }
    validates :name, :email, :password, format: { without: /\s/, 
        message: "can't include any spaces"}
    validates :email, uniqueness: true
end
