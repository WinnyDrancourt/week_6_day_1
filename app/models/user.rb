class User < ApplicationRecord
  has_secure_password
  belongs_to :city

  has_many :gossips
  has_many :poly_comments

  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true

  validates :email, confirmation: true
  validates :email_confirmation, presence: true

  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,}) # Minimum 8 charactere de longueur
    (?=.*\d) # Contient au mini 1 chiffre
    (?=.*[a-z]) # Au mini un lowecase
    (?=.*[A-Z]) # Au mini un uppercase
    (?=.[[:^alnum:]]) # Au mini 1 symbole
    /x
  validates :password, format: PASSWORD_REQUIREMENTS

end
