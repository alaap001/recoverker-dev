class Request < ApplicationRecord

has_one :status
#scope :passed , -> { joins(:status).where("statuses.passed = true")  }
belongs_to :user
belongs_to :college

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#validates_associated :status, :college,:user
validates :email , format: {with: VALID_EMAIL_REGEX}
validates :fullname,:email,:contact,:address_1,:fathername,:enrollment_no,:batch,:course,:extras,:college_id, presence: true
mount_uploader :fircopy,FircopyUploader

end
