class User < ApplicationRecord
    has_secure_password
   
    has_many :appointments
    has_many :coach_instructors, through: :appointments, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 3..14 }
    validates :password_digest, presence: true, length: { minimum: 6 }
    validates :email, presence: true, uniqueness: {case_sensitivity: false}, format: {with: VALID_EMAIL_REGEX}
    validates :phone_number, :full_name, presence: true
    
end
