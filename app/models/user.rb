class User < ApplicationRecord
  has_and_belongs_to_many :courses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { in: 1..100 }
  validates :last_name, presence: true, length: { in: 1..100 }
  validates :email, presence: true, length: { in: 1..150 }, format: { with: URI::MailTo::EMAIL_REGEXP }

  def teacher?
    role == "Teacher"
  end
end
