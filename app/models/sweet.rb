class Sweet < ApplicationRecord
  belongs_to :user
  attachment :sweet_image
end
