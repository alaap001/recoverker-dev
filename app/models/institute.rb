class Institute < ApplicationRecord

belongs_to :college
has_many :requests

end
