class SweetComment < ApplicationRecord
  belongs_to :user
  belongs_to :sweet
  has_many :notifications, dependent: :destroy
end
