class Sweet < ApplicationRecord
  belongs_to :user
  has_many :sweet_comments, dependent: :destroy
  attachment :sweet_image
end
