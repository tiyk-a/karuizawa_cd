class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :comments
  has_many :inquiries
    validates :user_name, presence: true
    validates :password, presence: true
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :post_code, presence: true
    validates :phone_number, presence: true
    

end
