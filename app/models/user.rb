class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :profile_image #refileを使うために必要
  validates :name, length: { in: 2..20 }

  def email_required?
    false
  end
  def email_changed?
    false
 end
end
