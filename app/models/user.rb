class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :taskboxes
  has_many :contacts
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
