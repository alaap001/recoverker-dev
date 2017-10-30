class College < ApplicationRecord

has_many :requests
mount_uploader :image,ImageUploader
def self.college_search(search)
if search
    if search.empty?
      where('name LIKE ?' , " ")
    else
  where('name LIKE ?', '%'+search+'%')
end
else
where('name LIKE ?' , " ")
end
end
end
