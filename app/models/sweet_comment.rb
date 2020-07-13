class SweetComment < ApplicationRecord
  belongs_to :user
  belongs_to :sweet
  #バリデーション
  validates :comment, presence: true
end
