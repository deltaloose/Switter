class SweetComment < ApplicationRecord
  belongs_to :user
  belongs_to :sweet
end
