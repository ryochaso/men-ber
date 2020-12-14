class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname,uniqueness: true
    validates :email, uniqueness: true
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :first_name, format: {with: /\A[a-zA-Z]+\z/}
    validates :family_name, format: {with:  /\A[a-zA-Z]+\z/}
    validates :country, format: {with: /\A[a-zA-Z]+\z/}
    
  end
end
