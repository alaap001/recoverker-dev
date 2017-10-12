class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :feedbacks

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email , format: {with: VALID_EMAIL_REGEX} , presence: true , uniqueness: true
has_many :requests
mount_uploader :userpic, UserpicUploader
acts_as_messageable
def name
  return self.fullname
end



end
